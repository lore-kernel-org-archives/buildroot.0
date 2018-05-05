From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 05 May 2018 13:48:03 +0200
Subject: [Buildroot] [PATCH] package/busybox: disable setfattr when attr
 package is enabled
In-Reply-To: <20180504203726.19657-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Fri, 4 May 2018 22:37:26 +0200")
References: <20180504203726.19657-1-yann.morin.1998@free.fr>
Message-ID: <87tvrmuxvw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > The install procedure of attr is kinda borked: it does not unlink any
 > existing destination file during installation, but directly wites into
 > it. So, when busybox is instaleld before attr and installs its applets
 > as hardlinks, attr will overwrite the setfattr file, thus borking the
 > busybox binary and all its applets.

 > So, when the attr package is enabled, we disable the setfattr applet.

 > Fixes: #10986.

 > Reported-by: mzweerspenko+bugzilla at gmail.com
 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: mzweerspenko+bugzilla at gmail.com

It would be nicer to instead fix the attr build system. I took a quick
look, and the problem seems to be that installation is done with their
own install-sh script which uses cp (and no --remove-destination).

I *THINK* a fix would just be to change the 'INSTALL =' line in
include/buildmacros to use normal install instead of this install-sh
script.

Could you give that a try?

-- 
Bye, Peter Korsgaard
