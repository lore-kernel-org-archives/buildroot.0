From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 23 Sep 2019 13:48:18 +0200
Subject: [Buildroot] [PATCH] toolchain: generate check-headers program
 under $(BUILD_DIR)
In-Reply-To: <CAJ4jsadbeyaFRcSYUWsBvTqAOCHQEhipQ8R4V31Hp8F29QdFVQ@mail.gmail.com>
References: <20190923010514.16269-1-unixmania@gmail.com>
 <6515_1569227955_5D8884B3_6515_6_12_20190923083847.GB3174@r-lnx-nyma7486-2>
 <CAJ4jsadbeyaFRcSYUWsBvTqAOCHQEhipQ8R4V31Hp8F29QdFVQ@mail.gmail.com>
Message-ID: <20190923134818.0dc51b3f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 23 Sep 2019 08:17:55 -0300
Carlos Santos <unixmania@gmail.com> wrote:

> > I'm rather surprised that check-headers is the nly thing broken in that
> > case... :-/
> >
> > Alternatively, we should probably use our own TMPDIR instead, which
> > would fix all such problems:
> >
> >     diff --git a/Makefile b/Makefile
> >     index 82c844620a..a006149898 100644
> >     --- a/Makefile
> >     +++ b/Makefile
> >     @@ -209,6 +209,11 @@ BASE_TARGET_DIR := $(BASE_DIR)/target
> >      HOST_DIR := $(BASE_DIR)/host
> >      GRAPHS_DIR := $(BASE_DIR)/graphs
> >
> >     +export TMPDIR = $(BUILD_DIR)/.br-temp-or-whatever
> >     +export TMP_DIR = $(TMPDIR)
> >     +export TEMP_DIR = $(TMPDIR)
> >     +# And so on...  
> 
> That would create all temporary files under
> $(BUILD_DIR)/.br-temp-or-whatever, ruining the advantage of using a
> tmpfs mounted at /tmp, which is much faster because it's in RAM.

The problem indeed only occurs with temporary files that need to be
*executed*. For example, gcc creates tons of temporary files in /tmp,
and that works perfectly fine and shouldn't be changed. So at this
point, I also tend to prefer Carlos solution to only address the
check-headers case.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
