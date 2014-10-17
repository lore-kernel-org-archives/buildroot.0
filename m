From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 17 Oct 2014 10:53:02 +0200
Subject: [Buildroot] libdaemons localstatedir /usr/var
In-Reply-To: <54406109.4050202@posteo.de>
References: <5439D19D.2030706@posteo.de>
 <20141012091818.04db85ae@free-electrons.com>
 <543A4928.5080901@posteo.de> <543A7D79.7010008@mind.be>
 <54406109.4050202@posteo.de>
Message-ID: <20141017105302.6f1f768c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Fri, 17 Oct 2014 02:21:29 +0200, J?rg Krause wrote:

> I started with setting --localstatedir=/var globally. There are three 
> packages which set localstatedir to another directory as /var:
> 
> * dhcp: It's save to remove local localstatedir here. Is it used for 
> setting leases and pid files. All leases and pid files are set as config 
> options in the dhcp.mk.

Ok.

> * proftpd: Uses localstatedir to set the location of the pid file:
> 
>     AC_DEFINE_UNQUOTED(PR_RUN_DIR, "`eval echo "${localstatedir}"`")
>     AC_DEFINE_UNQUOTED(PR_PID_FILE_PATH, "`eval echo
>     "${localstatedir}/proftpd.pid"`")
> 
> Maybe a patch should set it to?:
> 
>     AC_DEFINE_UNQUOTED(PR_RUN_DIR, "`eval echo "${localstatedir}/run"`")
>     AC_DEFINE_UNQUOTED(PR_PID_FILE_PATH, "`eval echo
>     "${localstatedir}/run/proftpd.pid"`")

Sounds good.

> * mysql: localstatedir sets the location for database directories and 
> other files. Not sure how to handle this.

You can keep a custom --localstatedir in mysql.mk.

One of the good thing with autoconf is that if you pass:

	--localstatedir=/var ... --localstatedir=/var/something

Then /var/something will be used. So, we can set --localstatedir=/var
by default in the infrastructure, and still have certain packages doing
weird things override it.

So this also means that your patch should be in at least two steps: one
step adding --localstatedir=/var to the infrastructure, and then one
patch removing --localstatedir=/var from the packages where this is no
longer needed.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
