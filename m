From: Petr Kulhavy <brain@jikos.cz>
Date: Tue, 9 May 2017 14:31:35 +0200
Subject: [Buildroot] [PATCH 1/1] ptp4l: new package
In-Reply-To: <20170509135119.242c028e@free-electrons.com>
References: <1494322944-22289-1-git-send-email-brain@jikos.cz>
 <20170509135119.242c028e@free-electrons.com>
Message-ID: <8313a8ee-1f5d-bd1a-1186-62112d7e7b7b@jikos.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

thank you for your review, I will do the corrections as per your 
suggestions and submit a new version of the patch.

Regarding the name you are correctly pointing out that the official web 
is called "Linux PTP Package".
However there are several other PTP implementations for Linux (ptpd, 
ptpd2) and in this context I find the name a bit too generic.
So I named the package after the "ptp4l" daemon, which is also the name 
used by few others to refer this package (e.g. Redhat or some 
conferences about PTP).
I'm however a bit undecided which name is better...


On 09/05/17 13:51, Thomas Petazzoni wrote:
> On Tue,  9 May 2017 11:42:24 +0200, Petr Kulhavy wrote:
>
>> +PTP4L_LICENSE_FILES = COPYING
>> +PTP4L_CFLAGS = $(TARGET_CFLAGS)
> Why is this variable useful?
>
> What is KBUILD_OUTPUT used for ?
>
>> +endef
>> +
>> +define PTP4L_INSTALL_TARGET_CMDS
>> +	$(TARGET_MAKE_ENV) $(MAKE) prefix=$(TARGET_DIR)/usr $(TARGET_CONFIGURE_OPTS) -C $(@D) install
> Please use instead:
>
> 	prefix=/usr DESTDIR=$(TARGET_DIR)
>
> Why are you passing TARGET_CONFIGURE_OPTS at install time and not build
> time ?
This is due to the unfortunate way the package's makefile is build:
The makefile calls the script incdefs.sh to detect some features and set 
the corresponding -Dxxxx flags in CFLAGS .
Unless KBUILD_OUTPUT is set the script searches in /usr/include, i.e. on 
host machine.

The makefile constructs its own CFLAGS based on the above and the 
environment CFLAGS are expected to be in EXTRA_CFLAGS.
So if CFLAGS are set on the make's command-line make doesn't call the 
incdefs.sh script and the detection and possibly the compilation fails.

That's why I couldn't use the TARGET_CONFIGURE_OPTS for the build phase.
However I left it as standard for the install phase.

I'm not sure if what I did is 100% clean, but it seems to work :-)

Petr
