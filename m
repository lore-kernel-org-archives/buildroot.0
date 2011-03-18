From: bruce bushby <bruce.bushby@gmail.com>
Date: Fri, 18 Mar 2011 11:16:39 +0000
Subject: [Buildroot] procps fails to compile on Fedora 14 due to newer
	version of GNU make
Message-ID: <AANLkTinvmWA5EWv+98t=YqasMOmxg4pusJgD4SQ7ayUV@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

I recently switched to Fedora 14 as my build platform and picked up a
problem compiling procps. This is apparently caused by newer versions of
make.

Previously I was building on ubuntu "natty" which has "make-3.81-8" ...
however Fedora 14 is using "make-3.82-2". There is a very nice explanation
here:
http://old.nabble.com/make-3.81.91---procps-3.2.8-td29281048.html

Where Paul Smith explains:
In previous versions of GNU make, wildcards were returned in sorted
order; however that was never guaranteed and the new version of make
(for efficiency) returns matches in "directory order", which is
essentially random.

Following the recommendations in that thread I made very simple patch:

[root at plxarm01 tmp]# cat procps-sort-order.patch
--- procps-3.2.7.orig/Makefile  2006-06-24 10:02:25.000000000 +0100
+++ procps-3.2.7/Makefile       2011-03-18 10:55:46.055307083 +0000
@@ -174,7 +174,7 @@
 # want this rule first, use := on ALL, and ALL not filled in yet
 all: do_all

--include */module.mk
+-include proc/module.mk ps/module.mk

 do_all:    $(ALL)


[root at plxarm01 tmp]#


I'm guessing forth coming versions of debian/ubuntu will also include
"make-3.82+" and probably experience the same issue.


Bruce
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110318/26d1d745/attachment-0001.html>
