From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 27 Dec 2014 21:52:14 +0100
Subject: [Buildroot] [PATCH] package/leafnode2: fix news user check
In-Reply-To: <20141227171318.42ba61a4@free-electrons.com>
References: <1419615491-8238-1-git-send-email-romain.naour@openwide.fr>
 <20141227171318.42ba61a4@free-electrons.com>
Message-ID: <549F1BFE.3050106@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 27/12/2014 17:13, Thomas Petazzoni a ?crit :
> Dear Romain Naour,
>
> On Fri, 26 Dec 2014 18:38:11 +0100, Romain Naour wrote:
>> --enable-runas-user use 'news' as default but the configure stop
>> if news doesn't exist on the build host.
>> Use 'root' while cross-compiling
>>
>> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
>> ---
>>  package/leafnode2/leafnode2.mk | 6 +++++-
>>  1 file changed, 5 insertions(+), 1 deletion(-)
> Applied, thanks. Here, leafnode2 does not start properly at boot time,
> it asks for a fully qualified host name in /etc/hosts. It would be good
> to add a default config file + init script to make leafnode2 work at
> least somewhat out of the box.
>
> Thanks!
>
> Thomas
Honestly, I haven't runtime tested leadnode2.
I just checked why the build has stopped during a random build.

The configure script run the command: id -u news:
a=`$ID -u $RUNAS_USER`
if test -z "$a" ; then
    as_fn_error $? "user $RUNAS_USER does not exist. Please add this user before building leafnode.
                  Most systems have man adduser or man useradd to tell you how to do this." "$LINENO" 5
else
...

This test is used to print a warning because it expect a native
build:
WARNING: user $RUNAS_USER cannot be used to run leafnode for security reasons.
Be sure to configure run_as_user to an unprivileged user, else leafnode will not run."

I'm adding Bernd to cc since it use leadnode2.

Best regards,
Romain
