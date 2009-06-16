From: Paul Archer <ptarcher@gmail.com>
Date: Tue, 16 Jun 2009 18:15:52 +1000
Subject: [Buildroot] Out of Tree programs
Message-ID: <56ea0bb80906160115u5e8066f2g47ca22cd32b9fd0c@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey All,

I would like to try to do two things with buildroot, and I am having
trouble finding examples or a howto.

1) I would like to write my own application. This means it doesn't
have a git or a website to download from, and will change alot as i
develop it. I would like to start with a simple helloworld.c and get
it to run.
2) I would like to build an out of tree kernel module and I am
confused as to how I should reference the kernel headers, I was
planning on writing my own kernel module and hence a simple
helloworld.ko would be nice to insert.

Are there any examples in the buildroot tree of either of these. I
have had a go at getting the helloworld program up and running I am
just not 100% sure if I did the correct thing.

My steps were:
Make a new directory /packages/helloworld

Made a helloworld.mk
#############################################################
#
# helloworld
#
#############################################################
HELLOWORLD_VERSION:=0.1
HELLOWORLD_SOURCE:=package/helloworld
HELLOWORLD_BINARY:=helloworld
HELLOWORLD_TARGET_BINARY:=usr/local/bin/helloworld

$(HELLOWORLD_SOURCE)/build/$(HELLOWORLD_BINARY):
    $(MAKE) CC=$(TARGET_CC) -C $(HELLOWORLD_SOURCE)

$(TARGET_DIR)/$(HELLOWORLD_TARGET_BINARY):
$(HELLOWORLD_SOURCE)/build/$(HELLOWORLD_BINARY)
    $(INSTALL) -D $(HELLOWORLD_SOURCE)/build/$(HELLOWORLD_BINARY)
$(HELLOWORLD_DIR)/$(HELLOWORLD_BINARY)
$(TARGET_DIR)/$(HELLOWORLD_TARGET_BINARY)

helloworld: uclibc $(TARGET_DIR)/$(HELLOWORLD_TARGET_BINARY)
    @echo Building helloworld

helloworld-source:

helloworld-clean:
    $(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C
$(HELLOWORLD_SOURCE) uninstall
    -$(MAKE) -C $(HELLOWORLD_SOURCE) clean

helloworld-dirclean:

#############################################################
#
# Toplevel Makefile options
#
#############################################################
ifeq ($(strip $(BR2_PACKAGE_HELLOWORLD)),y)
TARGETS+=helloworld
endif

Now in the file package/helloworld/src/helloworld.c
#include <stdio.h>
int main(int argc, char *argv[])
{
    printf("Hello World!!!\n");
    return 0;
}

It complained about no directory for 'usr/local/bin/helloworld' where
should I create this directory, in the which of the many skeleton
trees?

Instead of putting it straight into buildroot due to the above error I
instead tftp'ed it across and tried to run the helloworld program, but
that didn't work at all ( i can't remember the warning as this was 2
weeks ago now), it was like it was not an executable or not compiled
correctly.

Thats about where I got up to. I was a bit concered about the way i
was structuring the make file and was wondering if anyone else had
done something already or if there was already an example in buildroot
that does this. I would like the program to be re-built every time I
change the helloworld.c file just like a normal make would do.

Any help on either the helloworld C program or the helloworld module
would be great.


-- 
----
Regards
Paul Archer
ptarcher at gmail.com
