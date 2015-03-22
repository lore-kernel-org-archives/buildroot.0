From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 22 Mar 2015 17:21:08 +0100
Subject: [Buildroot] [PATCH] Busybox libselinux dependency.
In-Reply-To: <CAJ9_1op-4Ztin9kfON97ktjEiXaCXUaNiDwqzmu6gr_=xDBk8g@mail.gmail.com>
References: <CAJ9_1op-4Ztin9kfON97ktjEiXaCXUaNiDwqzmu6gr_=xDBk8g@mail.gmail.com>
Message-ID: <550EEBF4.9020508@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/03/15 17:02, Christopher Stone wrote:
> If you select the selinux applets when configuring busybox then the busybox
> build fails due to a missing selinux.h file. This is because there is no
> dependency on libselinux in the busybox make. The lack of dependency is
> completely understandable, since there is no such dependency when a user does
> not configure in the selinux applets. The attached patch adds a libselinux
> dependency to the busybox make when the libselinux package has been selected for
> the target. It is not unreasonable to assume that if a user selects libselinux,
> then he may also select the busybox selinux applets. Additionally, if the user
> has already selected libselinux for the target, then adding a dependency to
> libselinx to busybox does no harm, even if the user does not configure in the
> selinux applet, yet the build will not fail if the user does select those applets.
> 
> Thus, I submit the attached patch for your consideration.

 Hi Christopher,

 Thank you for your patch. However, you have not followed the patch submission
guidelines [1] which makes the patch harder to review. I'll indicate a few
points here, but there will probably be more.

 The patch title should be:

busybox: add conditional dependency on libselinux


 The explanation you give in your mail above should be put in the commit message.


 The comment you added is a bit long, perhaps:

# The user may select the selinux support applets.
# We'll assume he's smart enough to select libselinux in that case.
ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
BUSYBOX_DEPENDENCIES += libselinux
BUSYBOX_LDFLAGS += -lselinux
endif


 Regards,
 Arnout


[1] http://nightly.buildroot.org/manual.html#submitting-patches


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
