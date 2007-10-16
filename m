From: Robert P. J. Day <rpjday@crashcourse.ca>
Date: Tue, 16 Oct 2007 16:44:15 -0400 (EDT)
Subject: [Buildroot] trying to confirm Config.in error with
	BR2_DEFAULT_KERNEL_HEADERS
Message-ID: <Pine.LNX.4.64.0710161639080.23925@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


  as a followup to an earlier post of mine, can someone confirm one
way or the other that there is a build error if you end up selecting a
snapshot of the linux kernel.

  from toolchain/kernel-headers/Config.in, you can see the config
entry:

config BR2_DEFAULT_KERNEL_HEADERS
        string
        default "2.4.25"        if BR2_KERNEL_HEADERS_2_4_25
        default "2.4.27"        if BR2_KERNEL_HEADERS_2_4_27
        default "2.4.29"        if BR2_KERNEL_HEADERS_2_4_29
        default "2.4.31"        if BR2_KERNEL_HEADERS_2_4_31
        default "2.6.9"         if BR2_KERNEL_HEADERS_2_6_9
        default "2.6.11"        if BR2_KERNEL_HEADERS_2_6_11
        default "2.6.12"        if BR2_KERNEL_HEADERS_2_6_12
        default "2.6.20.4"      if BR2_KERNEL_HEADERS_2_6_20_4
        default "2.6.20.20"     if BR2_KERNEL_HEADERS_2_6_20
        default "2.6.21.5"      if BR2_KERNEL_HEADERS_2_6_21_5
        default "2.6.21.7"      if BR2_KERNEL_HEADERS_2_6_21
        default "2.6.22.1"      if BR2_KERNEL_HEADERS_2_6_22_1
        default "2.6.22.10"     if BR2_KERNEL_HEADERS_2_6_22_10
        default "2.6.22.10"     if BR2_KERNEL_HEADERS_2_6_22
        default "2.6.23"        if BR2_KERNEL_HEADERS_2_6_22
        default "2.6"           if BR2_KERNEL_HEADERS_SNAP

however, if you end up with a value of simply "2.6", that's going to
cause problems in toolchain/kernel-headers/kernel-headers-new.makefile
here:

...
LNXVER:=$(subst ., , $(strip $(DEFAULT_KERNEL_HEADERS)))
VERSION:=$(word 1, $(LNXVER))
PATCHLEVEL:=$(word 2, $(LNXVER))
SUBLEVEL:=$(word 3, $(LNXVER))
EXTRAVERSION:=$(word 4, $(LNXVER))
LOCALVERSION:=
...

since that Makefile *clearly* assumes that SUBLEVEL is a non-null
value later on.

  is there any way that can possibly work with a value of simply "2.6"
which has no sublevel value?

rday
-- 
========================================================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://crashcourse.ca
========================================================================
