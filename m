From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 17 May 2021 20:55:20 +0200
Subject: [Buildroot] Suggestion to "support/scripts/apply-patches.sh: do
 not apply patches with renames"
In-Reply-To: <CAALxPJ0ghoLYBvUmdkAe3+ibwS5eSsHo_NLLRXwe+Tqkd6Gk_Q@mail.gmail.com>
References: <CAALxPJ0qprnhxWtHGg7oeY=Ws4+w3Wt-_hdM1WvbL6B42jQO5g@mail.gmail.com>
 <87fsyopkcr.fsf@dell.be.48ers.dk> <20210515094010.GA2506@scaer>
 <CAALxPJ0ghoLYBvUmdkAe3+ibwS5eSsHo_NLLRXwe+Tqkd6Gk_Q@mail.gmail.com>
Message-ID: <5467486f-4aaa-bb7b-33b0-7f44a278dd9f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Ryota,

 In addition to Yann's comments, I have two of my own:

On 16/05/2021 10:18, Ryota Kinukawa wrote:
[snip]
> ?# apply-patches.sh needs patch with --no-backup-if-mismatch support (GNU,
> busybox w/DESKTOP)
> ?if ! patch --no-backup-if-mismatch </dev/null 2>/dev/null; then
> ? ? ? ? echo "Your patch program does not support the --no-backup-if-mismatch
> option. Install GNU patch"
> ? ? ? ? exit 1
> ?fi

 This test is no longer needed, the version test covers it.

> +PATCH_VERSION=$(patch --version 2>&1 | sed -e 's/^.* \([0-9\.]\)/\1/g' -e
> 's/[-\ ].*//g' -e '1q')

 Non-GNU patch implementations may not accept --version or produce otherwise
different output. I think a better sed expression would be:

patch --version | sed -n '/GNU patch \(.*\)/s//\1/p'

and add a check that PATCH_VERSION is not empty.

With Yann's cut-based extraction of MAJOR and MINOR, this will work even if
there's other distro-specific stuff at the end of the version.

 Regards,
 Arnout

> +PATCH_MAJOR=$(echo $PATCH_VERSION | sed -e "s/\..*//g")
> +PATCH_MINOR=$(echo $PATCH_VERSION | sed -e "s/^$PATCH_MAJOR\.//g" -e
> "s/\..*//g" -e "s/[a-zA-Z].*//g")
> +if [ $PATCH_MAJOR -lt 2 ] || [ $PATCH_MAJOR -eq 2 -a $PATCH_MINOR -lt 7 ] ; then
> + ? ? ? echo
> + ? ? ? echo "You have GNU patch '$PATCH_VERSION' installed.? GNU patch >=2.7 is
> required"
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
> - ? ? ? ?echo "Error: patch contains some renames, not supported by old patch
> versions"
> - ? ? ? ?exit 1
> - ? ?fi
> ? ? ?echo "${path}/${patch}" >> ${builddir}/.applied_patches_list
> ? ? ?${uncomp} "${path}/$patch" | patch -g0 -p1 -E --no-backup-if-mismatch -d
> "${builddir}" -t -N $silent
> ? ? ?if [ $? != 0 ] ; then
> 
> Regards,
> Ryota Kinukawa
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
