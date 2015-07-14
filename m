From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Tue, 14 Jul 2015 11:52:41 +0200
Subject: [Buildroot] [PATCH 02/11] ejabberd: simplify init script by
 patching ejabberdctl
In-Reply-To: <20150711123051.664507d5@free-electrons.com>
References: <1436349264-11797-1-git-send-email-johan.oudinet@gmail.com>
 <1436349264-11797-3-git-send-email-johan.oudinet@gmail.com>
 <20150711123051.664507d5@free-electrons.com>
Message-ID: <CAJtjsKZeXXQvGimN=Zq1gdPLSwX5LY1J=Jh0J9L8SYwBK6y9XQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Sat, Jul 11, 2015 at 12:30 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>
> On Wed,  8 Jul 2015 11:54:15 +0200, Johan Oudinet wrote:
>> Let a user modify environment variables used in ejabberdctl by loading
>> a default configuration file.
>>
>> Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
>> ---
>>  package/ejabberd/0009-fix-ejabberdctl.patch | 21 +++++++++++++++++++
>>  package/ejabberd/S50ejabberd                | 32 +++++++++++++----------------
>>  2 files changed, 35 insertions(+), 18 deletions(-)
>>  create mode 100644 package/ejabberd/0009-fix-ejabberdctl.patch
>>
>> diff --git a/package/ejabberd/0009-fix-ejabberdctl.patch b/package/ejabberd/0009-fix-ejabberdctl.patch
>> new file mode 100644
>> index 0000000..9ae23ac
>> --- /dev/null
>> +++ b/package/ejabberd/0009-fix-ejabberdctl.patch
>> @@ -0,0 +1,21 @@
>> +Description: fix ejabberdctl
>> + Change default values so ejabberdctl run commands as ejabberd user
>> + Also add a way for the user to change default values.
>> +Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
>> +
>> +diff --git a/ejabberdctl.template b/ejabberdctl.template
>> +index 79f4438..df0abba 100755
>> +--- a/ejabberdctl.template
>> ++++ b/ejabberdctl.template
>> +@@ -14,7 +14,10 @@ SCRIPT_DIR=`cd ${0%/*} && pwd`
>> + ERL={{erl}}
>> + IEX={{bindir}}/iex
>> + EPMD={{bindir}}/epmd
>> +-INSTALLUSER={{installuser}}
>> ++INSTALLUSER=ejabberd
>
> So this makes the patch Buildroot specific. Why isn't the
> {{installuser}} properly replaced by the "right" value at install time?

If we define the installuser variable, then the Makefile try to chmod
files with this user, which does not necessarily exist in the host
system. Debian packaging of ejabberd does the same trick to not set
the installuser variable and patch the ejabberdctl instead. In the
last buildroot version of ejabberd, each call of ejabberdctl was
prefixed by "su ejabberd -c", which is less convenient than fixing
INSTALLUSER to ejabberd.
If you prefer, I could modify this variable in a post-build hook.

>
>> ++
>> ++# Read default configuration file if present.
>> ++[ ! -r /etc/default/ejabberd ] || . /etc/default/ejabberd
>
> I don't really understand why we are loading this default file here and
> in the init script itself. Who is installing this /etc/default/ejabberd
> file? What does it contain?

I like shell scripts that read a configuration files in /etc/default
so one can modify the script behavior without modifying it.
No one is installing a /etc/default/ejabberd but I do use one in my
installation where I set ERLANG_NODE to a specific IP address for
ejabberd clustering and SPOOL_DIR to a temporary directory because the
default spool directory (/var/lib/ejabberd) is read-only in my system.
I understand this is something common in debian packaging but not in
Buildroot. What's your suggestion?

>
>> +
>> + # check the proper system user is used if defined
>> + if [ "$INSTALLUSER" != "" ] ; then
>> diff --git a/package/ejabberd/S50ejabberd b/package/ejabberd/S50ejabberd
>> index ff38d92..2161ead 100644
>> --- a/package/ejabberd/S50ejabberd
>> +++ b/package/ejabberd/S50ejabberd
>> @@ -3,30 +3,26 @@
>>  # Start/stop ejabberd
>>  #
>>
>> -NAME=ejabberd
>> -USER=ejabberd
>> +CTL=/usr/sbin/ejabberdctl
>> +DEFAULT=/etc/default/ejabberd
>> +INSTALLUSER=ejabberd
>>  RUNDIR=/var/run/ejabberd
>> -SPOOLDIR=/var/lib/ejabberd
>>
>> -# Read configuration variable file if it is present.
>> -[ -r /etc/default/$NAME ] && . /etc/default/$NAME
>> +# Read default configuration file if present.
>> +[ -r "$DEFAULT" ] && . "$DEFAULT"
>
> And we're reading the /etc/default/ejabberd file here as well.
>
> Can you give some more details about what is going on?

Well, that's just for having a flexible script. Actually, in the
previous buildroot packaging, I did not modify ejabberdctl to read an
/etc/default/ejabberd file. Thus, I had to read it here and call
ejabberdctl with --spool "$SPOOLDIR" option to change it. This was
less convenient as one couldn't use ejabberdctl afterward without
providing the same options given by /etc/init.d/S50ejabberd. Now,
since ejabberdctl reads /etc/default/ejabberd, the init script is much
simpler and one can use either the init script or ejabberdctl
directly. We could remove the read of /etc/default/ejabberd here, as
the only variables that can be changed are CTL, INSTALLUSER, and
RUNDIR; it's unlikely that someone needs to change them.

>
>>
>> +# Create RUNDIR.
>>  mkrundir() {
>> -    install -d -o "$USER" -g "$USER" "$RUNDIR" "$SPOOLDIR"
>> -}
>> -
>> -# Run ejabberdctl as user $USER.
>> -ctl() {
>> -    su $USER -c "ejabberdctl $*"
>> +    install -d -o "$INSTALLUSER" -g "$INSTALLUSER" "$RUNDIR"
>>  }
>>
>>  case "$1" in
>>      start)
>>          mkrundir || exit 1
>>          echo -n "Starting ejabberd... "
>> -        ctl start --spool "$SPOOLDIR"
>> +        "$CTL" start
>>          # Wait until ejabberd is up and running.
>> -        if ctl started; then
>> +        if "$CTL" started; then
>>              echo "done"
>>          else
>>              echo "failed"
>> @@ -34,23 +30,23 @@ case "$1" in
>>          ;;
>>      stop)
>>          echo -n "Stopping ejabberd... "
>> -        ctl stop > /dev/null
>> -        if [ $? -eq 3 ] || ctl stopped; then
>> +        "$CTL" stop > /dev/null
>> +        if [ $? -eq 3 ] || "$CTL" stopped; then
>>              echo "OK"
>>          else
>>              echo "failed"
>>          fi
>>          ;;
>>      status)
>> -        ctl status
>> +        "$CTL" status
>>          ;;
>>      restart|force-reload)
>> -        "$0" stop
>> +        "$0" stop || true
>
> This change doesn't seem to be related.

Which one? Using $CTL instead of ctl because we removed the ctl
function or try to start the service even if stop failed?
I agree that the second one is not related to the simplification of
the init script. Should I split it in another commit?

-- 
Johan
()  ascii ribbon campaign - against html e-mail
/\  www.asciiribbon.org   - against proprietary attachments
