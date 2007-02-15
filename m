From: Bobby Ramsook <bobby.83x2@gmail.com>
Date: Thu, 15 Feb 2007 02:56:27 -0500
Subject: [Buildroot] Problem building build root in a squashhfs image
In-Reply-To: <12d878080702142341q47408d7fib76e4954763a3677@mail.gmail.com>
References: <12d878080702111341q1b2b9468w53aff97f6c6ccb0c@mail.gmail.com>
	<20070212090729.58cf28f0.philippe.ney@pardes.ws>
	<12d878080702142303k63ed50a7jb99f7b5d3bf21617@mail.gmail.com>
	<12d878080702142341q47408d7fib76e4954763a3677@mail.gmail.com>
Message-ID: <12d878080702142356o85daefetee5e8eb2cfbc90c1@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If any one else is having problems, may be it might be related to the
following lines:

LINES 59-79
--------------------------MY----EDIT--------------------------------------------------------------
ifneq ($(strip $(LINUX26_VERSION)),$(strip $(LINUX_HEADERS_VERSION)))
$(DL_DIR)/$(LINUX26_SOURCE):
    echo "Getting $(WGET) -P $(DL_DIR) $(LINUX26_SITE)/$(LINUX26_SOURCE)"
     $(WGET) -P $(DL_DIR) $(LINUX26_SITE)/$(LINUX26_SOURCE)
-->endif

$(LINUX26_DIR)/.unpacked: $(DL_DIR)/$(LINUX26_SOURCE)
    rm -rf $(LINUX26_DIR)
    $(LINUX26_BZCAT) $(DL_DIR)/$(LINUX26_SOURCE) | tar -C $(BUILD_DIR)
$(TAR_OPTIONS) -
ifneq ($(DOWNLOAD_LINUX26_VERSION),$(LINUX26_VERSION))
    # Rename the dir from the downloaded version to the AFTER patch version
    mv -f $(BUILD_DIR)/linux-$(DOWNLOAD_LINUX26_VERSION)
$(BUILD_DIR)/linux-$(LINUX26_VERSION)
endif
    touch $@

$(LINUX26_DIR)/.patched: $(LINUX26_DIR)/.unpacked
-->#    toolchain/patch-kernel.sh $(LINUX26_DIR) $(LINUX26_PATCH_DIR)
-->#endif  ($(LINUX26_VERSION),$(LINUX_HEADERS_VERSION))
    touch $@
------------------------END--MY----EDIT-----------------------------------------------------------


The above worked for me after I made the changes indicated by the -->
What exaxtly is the check for the linux_version against the headers_version
doing?  Both LINUX_VERSION and  LINUX_HEADERS_VERSION are defined at the top
of the linux26.mk. Why check it twice?


LINES 59-78
------------------------ORIGINAL----EDIT-----------------------------------------------------------
ifneq ($(strip $(LINUX26_VERSION)),$(strip $(LINUX_HEADERS_VERSION)))
$(DL_DIR)/$(LINUX26_SOURCE):
$(WGET) -P $(DL_DIR) $(LINUX26_SITE)/$(LINUX26_SOURCE)

$(LINUX26_DIR)/.unpacked: $(DL_DIR)/$(LINUX26_SOURCE)
rm -rf $(LINUX26_DIR)
$(LINUX26_BZCAT) $(DL_DIR)/$(LINUX26_SOURCE) | tar -C $(BUILD_DIR)
$(TAR_OPTIONS) -
ifneq ($(DOWNLOAD_LINUX26_VERSION),$(LINUX26_VERSION))
# Rename the dir from the downloaded version to the AFTER patch version
mv -f $(BUILD_DIR)/linux-$(DOWNLOAD_LINUX26_VERSION)
$(BUILD_DIR)/linux-$(LINUX26_VERSION)
endif
touch $@

$(LINUX26_DIR)/.patched: $(LINUX26_DIR)/.unpacked
toolchain/patch-kernel.sh $(LINUX26_DIR) $(LINUX26_PATCH_DIR)
touch $@
endif # ($(LINUX26_VERSION),$(LINUX_HEADERS_VERSION))

------------------------END-ORIGINAL----EDIT-----------

---------------------------------------------


On 2/15/07, Bobby Ramsook <bobby.83x2@gmail.com> wrote:
>
> I dont supposed the admin of the list can remove that telephone number on
> my last post?
>
> On 2/15/07, Bobby Ramsook < bobby.83x2@gmail.com> wrote:
> >
> > So I was looking throught the target/linux26.mk
> > and I noticed the linux26-menuconfig
> > but when I run it I get:
> >
> > bobby at ubuntu:/usr/src/buildroot$ make linux26-menuconfig
> > make: *** No rule to make target `/usr/src/buildroot/build_i686/linux-
> > 2.6.12/.patched', needed by `linux26-menuconfig'.  Stop.
> >
> > The source is from the svn checkout date 2-11-07
> >
> >
> > On 2/12/07, Philippe Ney < philippe.ney@pardes.ws> wrote:
> > >
> > > > I Have been trying to compile buildroot, but i keep getting stuck on
> > > the
> > > > following error:
> > > >
> > > > make: *** No rule to make target
> > > > `/usr/src/buildroot/build_i586/linux-2.6.12/.patched',
> > > > needed by `/usr/src/buildroot/build_i586/linux- 2.6.12
> > > /.configured'.  Stop.
> > >
> > > Hi,
> > >
> > > If you copy-paste the error in the mail, then it's certainly due to
> > > the
> > > space character.
> > >
> > > Otherwise, check the linux.mk makefile.
> > >
> > > Philippe
> > > _______________________________________________
> > > buildroot mailing list
> > > buildroot at uclibc.org
> > > http://busybox.net/mailman/listinfo/buildroot
> > >
> >
> >
> >
> > --
> > Bobby Ramsook
> > CCNY Computer Tech
> > Grad Date (EXP):  07'
> >
>
>
>
> --
> Bobby Ramsook
> CCNY Computer Tech
> Grad Date (EXP):  07'
>



-- 
Bobby Ramsook
CCNY Computer Tech
Grad Date (EXP):  07'
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070215/0610cdaa/attachment.htm 
