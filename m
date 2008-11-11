From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Tue, 11 Nov 2008 15:43:35 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
In-Reply-To: <4919943B.6080309@free.fr>
References: <20081110104547.16BEB3C7BC@busybox.net>
	<20081110110131.GA16174@mx.loc> <4919943B.6080309@free.fr>
Message-ID: <20081111144335.GB24761@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Nov 11, 2008 at 03:18:35PM +0100, Julien Boibessot wrote:
>Hi,
>
>Bernhard Reutner-Fischer a ?crit :
>> On Mon, Nov 10, 2008 at 02:45:47AM -0800, vanokuten at uclibc.org wrote:
>>> Author: vanokuten
>>> Date: 2008-11-10 02:45:46 -0800 (Mon, 10 Nov 2008)
>>> New Revision: 23987
>>>
>>> Log:
>>> Download Kernel.org minor patches at the same time as full sources.
>>
>> The comment is correct but the impl is wrong since you do not
>> _download_ all required stuff
>> at the proper time.
>> So: Iff there are patches, those patches are prerequesites of the
>> _SOURCE which will
>> automagically make 'make source' do the right thing.
>If patches are set as prerequesites of LINUX26_SOURCE then, each time a
>new set of patches are loaded, full sources will be reloaded again.
>(User can "dynamically" choose the patch revision he wants to use).
>
>I can update the patch to have something like that:
>
>Index: target/linux/Makefile.in.advanced
>===================================================================
>--- target/linux/Makefile.in.advanced   (r?vision 23996)
>+++ target/linux/Makefile.in.advanced   (copie de travail)
>@@ -205,7 +205,7 @@
>         $(WGET) -P $(DL_DIR) $(LINUX26_PATCH_SITE)/$(LINUX26_PATCH_SOURCE)
> endif
>
>-$(LINUX26_DIR)/.unpacked: $(DL_DIR)/$(LINUX26_SOURCE)
>+$(LINUX26_DIR)/.unpacked: $(DL_DIR)/$(LINUX26_SOURCE)
>$(DL_DIR)/$(LINUX26_PATCH_SOURCE)

yes, except that you'll have to use some
ifneq ($(LINUX26_PATCH_SOURCE),)
LINUX26_PATCH_SOURCE_FILE:=$(DL_DIR)/$(LINUX26_PATCH_SOURCE)
endif
and use LINUX26_PATCH_SOURCE_FILE, otherwise you'd end up with the dl dir as a
prereq and this wouldn't do any good if you downloaded anything.

>        rm -rf $(LINUX26_DIR)
>        @echo "*** Unpacking kernel source"
>        $(LINUX26_BZCAT) $(DL_DIR)/$(LINUX26_SOURCE) | tar -C
>$(PROJECT_BUILD_DIR) $(TAR_OPTIONS) -
>@@ -451,7 +451,7 @@
>
> linux26-modules: cross-depmod26
>$(PROJECT_BUILD_DIR)/autotools-stamps/linux_modules_target_installed
>
>-linux26-source: $(DL_DIR)/$(LINUX26_SOURCE)
>+linux26-source: $(DL_DIR)/$(LINUX26_SOURCE)
>$(DL_DIR)/$(LINUX26_PATCH_SOURCE)

close, yes.
>
> linux26-unpacked: $(LINUX26_DIR)/.patched
>
>
>
>But I'm not sure I can do more :-(

That would be the proper thing to do, modulo corrections mentioned above.
