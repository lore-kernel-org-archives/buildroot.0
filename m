From: =?windows-1252?Q?J=F6rg_Krause?= <jkrause@posteo.de>
Date: Fri, 17 Oct 2014 02:21:29 +0200
Subject: [Buildroot] libdaemons localstatedir /usr/var
In-Reply-To: <543A7D79.7010008@mind.be>
References: <5439D19D.2030706@posteo.de>
 <20141012091818.04db85ae@free-electrons.com> <543A4928.5080901@posteo.de>
 <543A7D79.7010008@mind.be>
Message-ID: <54406109.4050202@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,
Dear Arnout Vandecappelle,

On 10/12/2014 03:09 PM, Arnout Vandecappelle wrote:
> On 12/10/14 11:26, J?rg Krause wrote:
>>> >>Isn't --localstatedir a common autoconf variable ? I see 26 packages
>>> >>passing --localstatedir=/var in Buildroot. Maybe it's time to move as a
>>> >>common definition, like --prefix=/usr ?
>> >
>> >Yes, it is. There was a discussion on the mailing list long time ago:
>> >
>> >     Making --localstatedir=/var global?
>> >     (http://lists.busybox.net/pipermail/buildroot/2011-April/042918.html.)
>> >
>> >And also this one:
>> >
>> >     Bizarre things on the allyespackageconfig build
>> >     (http://lists.busybox.net/pipermail/buildroot/2013-May/071856.html)
>   +1 to making it a global pkg-autotools option. J?rg, care to prepare a patch
> for that? Removing the existing --localstatedir should be a separate patch then.

I started with setting --localstatedir=/var globally. There are three 
packages which set localstatedir to another directory as /var:

* dhcp: It's save to remove local localstatedir here. Is it used for 
setting leases and pid files. All leases and pid files are set as config 
options in the dhcp.mk.
* proftpd: Uses localstatedir to set the location of the pid file:

    AC_DEFINE_UNQUOTED(PR_RUN_DIR, "`eval echo "${localstatedir}"`")
    AC_DEFINE_UNQUOTED(PR_PID_FILE_PATH, "`eval echo
    "${localstatedir}/proftpd.pid"`")

Maybe a patch should set it to?:

    AC_DEFINE_UNQUOTED(PR_RUN_DIR, "`eval echo "${localstatedir}/run"`")
    AC_DEFINE_UNQUOTED(PR_PID_FILE_PATH, "`eval echo
    "${localstatedir}/run/proftpd.pid"`")

* mysql: localstatedir sets the location for database directories and 
other files. Not sure how to handle this.

Do you have any suggestions?

J?rg
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141017/1dcc90c1/attachment.html>
