From: Kantanu Kumar Mohapatra <kantanukumar@gmail.com>
Date: Tue, 30 Sep 2014 15:03:30 +0530
Subject: [Buildroot] Using u-boot tools
In-Reply-To: <CAAXf6LXKSX11OfGkaNeO=vRDCcCQVTAd00P-_g2qs_aqe2_R-Q@mail.gmail.com>
References: <CAJO1S91Kw0tsM-Azy7s9aVBaFORpB2Gp0-qrST2rDavorQUGjA@mail.gmail.com>
 <20140929111853.6881f323@free-electrons.com>
 <CAAXf6LXTaWD=4KrL3oF3Sy4dP+cFbX5fBK3LD7WACtRvuhxmqw@mail.gmail.com>
 <20140929152136.4d7cee9c@free-electrons.com>
 <CAJO1S935TBt+HHGQ43WH9fzG0s9oOEk0hfsi-OXrr83Td_umQg@mail.gmail.com>
 <20140929183824.5b7bc3e5@free-electrons.com>
 <CAJO1S92HBmxKivtoqZDEjGYt5e6xiQkrHnCPLi1H0O4E9xtixg@mail.gmail.com>
 <CAAXf6LVco1ikU6rfBSyNf_WZZfv4nBP1fhwcajfzoAN07wLZ7A@mail.gmail.com>
 <CAJO1S93CyRMH62V4+OU+403h0_p=9G247fT2foT5t1G36ZndsQ@mail.gmail.com>
 <CAAXf6LXKSX11OfGkaNeO=vRDCcCQVTAd00P-_g2qs_aqe2_R-Q@mail.gmail.com>
Message-ID: <CAJO1S93YXn=r9egsr-9V49Xq7+MsGUd4eLxDcX_fvcN_gXoCwg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Sep 30, 2014 at 1:28 AM, Thomas De Schampheleire <
patrickdepinguin@gmail.com> wrote:

> Hi Kantanu,
>
>
> On Mon, Sep 29, 2014 at 9:41 PM, Kantanu Kumar Mohapatra
> <kantanukumar@gmail.com> wrote:
> >
> > On 30-Sep-2014 12:44 AM, "Thomas De Schampheleire"
> > <patrickdepinguin@gmail.com> wrote:
> >>
> >> Hi Kantanu,
> >>
> >> (please don't top post)
> >>
> >> On Mon, Sep 29, 2014 at 8:43 PM, Kantanu Kumar Mohapatra
> >> <kantanukumar@gmail.com> wrote:
> >> > Many thanks.
> >> >
> >> > Yaa I too found it as the place to take the source. The thing is,
> uboot
> >> > tools is under auto-target. That's I am not much familiar with, how to
> >> > make
> >> > changes to that to take the source?
> >> >
> >> > I'll be thankful if you could help me to make changes to that
> makefile.
> >>
> >> Have a look at the manual chapter regarding adding new packages. It
> >> explains the different variables that exist, both for the generic and
> >> autotools infrastructures.
> >>
> http://buildroot.uclibc.org/downloads/manual/manual.html#adding-packages
> >>
> >> What Thomas Petazzoni suggested is to change the variable
> >> UBOOT_TOOLS_VERSION.
> >>
> >> Best regards,
> >> Thomas
> >
> > Thanks Thomas. I have tried with changing the tools version, that's not
> > working, as buildroot 10 not having uboot tool separate. fw_printenv
> comes
> > integrated with uboot-tools-10.03.
> >
> > I can see the target fw_printenv, gets compiled like this,
> > $(TARGET_DIR)/usr/sbin/fw_printenv: $(U_BOOT_DIR)/$(U_BOOT_BIN)
> > $(TARGET_CC) -I$(U_BOOT_DIR)/include -I$(LINUX_HEADERS_DIR)/include \
> > -DUSE_HOSTCC -o $@ \
> > $(U_BOOT_DIR)/tools/env/*.c $(U_BOOT_DIR)/lib_generic/crc32.c
> >
> > I am using here another -D flag in uboot-tools-10.03. Same thing want to
> > replicated for uboot tools 14 and same source only want to take.
>
> I don't understand you anymore.
> You want to remain at u-boot-tools 2010.03, when using buildroot
> 2014.xx, correct?
> So what you would do is change UBOOT_TOOLS_VERSION = 2010.03 inside
> buildroot 2014.xx.
>
> The 'uboot-tools' package is just using standard uboot sources, but
> only builds the tools in the tools directory.
>
> If this information is not clear enough to you, please try to rephrase
> in more details what you want to achieve. Please also be specific
> about the versions. In your first mail you mentioned
> buildroot-2014.03, but this does not exist.
>
> Thanks,
> Thomas
>


?Thanks a lot Thomas for your reply. Sorry for the typo, please consider
the new version as buildroot-2014.02.

Let me explain all in detail.

old br2:
========
version: 2010.05
uboot: 2010.03(customized)
uboot-tools: 2010.03 (used from uboot src)


New br2 (which I am upgrading to):
===========================
version: 2014.02
uboot: 2010.03(customized, same should be across tools too)
uboot-tools: 2014.01 ( should be same as uboot-2010.03)

In br2-14, I am getting the uboot image(.bin) properly, which I customized
to get a .rom with my headers added to it, done in boot/uboot/uboot.mk

Here the problem which I faced is "fw_printenv" executable, which is built
in tools, for br2-2014.02. fw_printenv is created, when getting the uboot
image in br2-2010.03 (target/uboot/Makefile.in).

In br2-2014.02,
Tools should be taken from the source, which went into
output/build/uboot-2010.03, But instead it creates another
uboot-tools-2014.01 inside output/build/ and places source there.

How to build that fw_printenv, in old way like br2-10, seen as below?

$(TARGET_DIR)/usr/sbin/fw_printenv: $(U_BOOT_DIR)/$(U_BOOT_BIN)
    mkdir -p $(@D)
    $(TARGET_CC) -I$(U_BOOT_DIR)/include -I$(LINUX_HEADERS_DIR)/include \
        -D_custom_flag \
        -DUSE_HOSTCC -o $@ \
        $(U_BOOT_DIR)/tools/env/*.c $(U_BOOT_DIR)/lib_generic/crc32.c

I want to use another "-D_custom_flag" to build "fw_printenv", in br2-14.
Please suggest me the changes to be done. If I change   UBOOT_TOOLS_VERSION
= 2010.03, in  uboot-tools.mk, getting compilation error, as it has
dependency on host-tools.?

Thanks,
Kantanu
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140930/55425bc3/attachment.html>
