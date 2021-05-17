From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 17 May 2021 14:46:14 +0200
Subject: [Buildroot] Suggestion to "support/scripts/apply-patches.sh: do
 not apply patches with renames"
In-Reply-To: <CAALxPJ0ghoLYBvUmdkAe3+ibwS5eSsHo_NLLRXwe+Tqkd6Gk_Q@mail.gmail.com>
References: <CAALxPJ0qprnhxWtHGg7oeY=Ws4+w3Wt-_hdM1WvbL6B42jQO5g@mail.gmail.com>
 <87fsyopkcr.fsf@dell.be.48ers.dk> <20210515094010.GA2506@scaer>
 <CAALxPJ0ghoLYBvUmdkAe3+ibwS5eSsHo_NLLRXwe+Tqkd6Gk_Q@mail.gmail.com>
Message-ID: <20210517124614.GU2506@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ryota, All,

Thanks for sending a patch so quickly! :-)

On 2021-05-16 17:18 +0900, Ryota Kinukawa spake thusly:
> > So, lets do it that way;
> > ?1. add a check in support/dependencies/dependencies.sh that patch >=
> > ? ? 2.7 (just after/before the check for --no-backup-if-mismatch)
> > ?2. drop the test for renames in support/scripts/apply-patches.sh
> > Ryota, would you care to work on that and send the patches to the list,
> > please?
> 
> Here is the patch, could you confirm this?

Please see my comments below. Also, please send it directly as its own
mail; using  "git send-email"  makes it easy to send a patch.

Also, please provide an actual commit log. For example:

    support/apply-patches: accept patches with renames

    Currently, patches with renames are refused, as they reqire patch >=
    2.7. So far, we did not require that version because it was too
    recent to be widely available.

    But patch 2.7 has been released in 2012, almost 9 years ago now; it
    is old enough that we can start relying on it.

    Add a check that patch is 2.7 or newer, and drop the check about
    renames in apply-patches.sh.

    Signed-off-by: Yor NAME <your@email>

> diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
> index 1954f038be..030a2196f9 100755
> --- a/support/dependencies/dependencies.sh
> +++ b/support/dependencies/dependencies.sh
> @@ -163,7 +163,7 @@ fi
> 
> ?# Check that a few mandatory programs are installed
> ?missing_progs="no"
> -for prog in patch perl tar wget cpio unzip rsync bc ${DL_TOOLS} ; do
> +for prog in perl tar wget cpio unzip rsync bc ${DL_TOOLS} ; do
> ? ? ? ? if ! which $prog > /dev/null ; then
> ? ? ? ? ? ? ? ? echo "You must install '$prog' on your build machine";
> ? ? ? ? ? ? ? ? missing_progs="yes"
> @@ -183,11 +183,24 @@ if test "${missing_progs}" = "yes" ; then
> ? ? ? ? exit 1
> ?fi
> 
> +# Check patch
> +if ! which patch > /dev/null ; then
> + ? ? ? echo "You must install GNU patch on your build machine";
> + ? ? ? exit 1
> +fi

There is no need for a dedicated check for patch; just leave it in the
list, above.

> ?# apply-patches.sh needs patch with --no-backup-if-mismatch support (GNU, busybox w/DESKTOP)
> ?if ! patch --no-backup-if-mismatch </dev/null 2>/dev/null; then
> ? ? ? ? echo "Your patch program does not support the --no-backup-if-mismatch option. Install GNU patch"
> ? ? ? ? exit 1
> ?fi
> +PATCH_VERSION=$(patch --version 2>&1 | sed -e 's/^.* \([0-9\.]\)/\1/g' -e 's/[-\ ].*//g' -e '1q')
> +PATCH_MAJOR=$(echo $PATCH_VERSION | sed -e "s/\..*//g")
> +PATCH_MINOR=$(echo $PATCH_VERSION | sed -e "s/^$PATCH_MAJOR\.//g" -e "s/\..*//g" -e "s/[a-zA-Z].*//g")

Although I pretty much like regular expressions, I prefer that we do
without when needed, which is the case here:

    PATCH_VERSION="$(patch -v |awk '{ print $(3); exit; }')"
    PATCH_VERSION_MAJOR="$(cut -d . -f 1 <<<"${PATCH_VERSION}")"
    PATCH_VERSION_MINOR="$(cut -d . -f 2 <<<"${PATCH_VERSION}")"

(note: quote all your expansions, both variable expansion and shell
expansion).

> +if [ $PATCH_MAJOR -lt 2 ] || [ $PATCH_MAJOR -eq 2 -a $PATCH_MINOR -lt 7 ] ; then

Quote your variable expansion, and expand variables with curly braces;

    "${PATCH_MAJOR}"

Note: I know you got inspiration from the rest of the script, which was
a good idea, but the script has been inherited from way back then a long
time ago, when we did not have coding rules... No reason not to do better
nowadays! ;-)

> + ? ? ? echo
> + ? ? ? echo "You have GNU patch '$PATCH_VERSION' installed.? GNU patch >=2.7 is required"
> + ? ? ? exit 1;
> +fi
> 
> ?if grep ^BR2_NEEDS_HOST_UTF8_LOCALE=y $BR2_CONFIG > /dev/null; then
> ? ? ? ? if ! which locale > /dev/null ; then
> diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
> index 9fb488c570..e5a2fdd09e 100755
> --- a/support/scripts/apply-patches.sh
> +++ b/support/scripts/apply-patches.sh
> @@ -113,11 +113,6 @@ function apply_patch {
> ? ? ? ? ?echo " ?to be applied ?: ${path}/${patch}"
> ? ? ? ? ?exit 1
> ? ? ?fi
> - ? ?if ${uncomp} "${path}/$patch" | grep -q "^rename from" && \
> - ? ? ? ${uncomp} "${path}/$patch" | grep -q "^rename to" ; then
> - ? ? ? ?echo "Error: patch contains some renames, not supported by old patch versions"
> - ? ? ? ?exit 1
> - ? ?fi

ACK.

Care to resend with the above changes, please?

> ? ? ?echo "${path}/${patch}" >> ${builddir}/.applied_patches_list
> ? ? ?${uncomp} "${path}/$patch" | patch -g0 -p1 -E --no-backup-if-mismatch -d "${builddir}" -t -N $silent
> ? ? ?if [ $? != 0 ] ; then
> Regards,
> Ryota Kinukawa

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
