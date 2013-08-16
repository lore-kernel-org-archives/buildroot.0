From: John OSullivan <john.osullivan@cloudiumsystems.com>
Date: Fri, 16 Aug 2013 14:12:41 +0100
Subject: [Buildroot] Managing circular dependencies
Message-ID: <001101ce9a82$4cc6b540$e6541fc0$@osullivan@cloudiumsystems.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

 

I have some code which I have inherited and I am in the process of
integrating into a buildroot-2012.05 based build system. The problem is that
package (A) creates a static library, in creating this it references headers
in package (B). Package (B) has a dependency on the static library built by
package (A).

The code I have is a bit of a mess but at the moment I just need to get it
building within buildroot. I can think of a number of ugly hacks but I was
wondering what approach I should take to this in buildroot. I had thought
that the staging area in output/staging might help but I am not sure what
its intended purpose is.

In terms of the package files.

I set packageA.mk to have a dependency with PACKAGEA_DEPENDENCIES =
host-cmake packageB

And also

I set packageB.mk to have a dependency with PACKAGEB_DEPENDENCIES =
host-cmake packageA

 

As it build package (A) I see a message Package (B) dependency dropped.

I had tried a line like:

#define PACKAGEA_INSTALL_STAGING_CMDS

               $(INSTALL) -D -m 0755 $(@)/packagealib.a
$(STAGING_DIR)/usr/lib/packagealib.a

 

But this just deposits the file in output/host/usr

I had thought that if I got the necessary header files into
output/usr/include or some such location then it might be the basis of a
solution.

Is there a particular approach I need to take here?

 

 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130816/b1d2ab4e/attachment.html>
