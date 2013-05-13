From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 14 May 2013 01:02:45 +0200
Subject: [Buildroot] [PATCH 1/6] package infra: remove CPPFLAGS from
	CFLAGS
In-Reply-To: <5191647F.6010408@zacarias.com.ar>
References: <1368463259-18958-1-git-send-email-gustavo@zacarias.com.ar>
 <20130513191016.15f0a3f4@skate> <51912140.8030901@zacarias.com.ar>
 <20130513202047.6bd6da1b@skate> <5191647F.6010408@zacarias.com.ar>
Message-ID: <51917115.7090501@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14/05/13 00:09, Gustavo Zacarias wrote:
> On 05/13/2013 03:20 PM, Thomas Petazzoni wrote:
>> I believe there should be first an audit of where TARGET_CFLAGS is
>> used. Then, wherever needed, fixes to ensure both TARGET_CFLAGS and
>> TARGET_CPPFLAGS are used (or, if possible, usage of
>> TARGET_CONFIGURE_OPTS). Once those fixes are made, your patch that
>> separates TARGET_CPPFLAGS from TARGET_CFLAGS can go in.
>>
>> A quick "grep TARGET_CFLAGS" in package/ gives 110 packages using it.
>> In most cases, it's probably $(TARGET_CONFIGURE_OPTS) being passed +
>> CFLAGS="$(TARGET_CFLAGS) -bleh", which is already correct seems
>> CPPFLAGS is passed. But of course there might be packages that use a
>> custom Makefile that obeys to CFLAGS but not CPPFLAGS. Not sure what we
>> can do about these except slowly figuring out that they need fixing.
>
> Looking into generic packages which are the most likely to have
> differences because of custom Makefiles the general majority don't seem
> to understand CPPFLAGS, so other than doing
> SOMETHING="$(TARGET_CPPFLAGS) $(TARGET_CFLAGS)" there doesn't seem to be
> much to do about it.
> We could define a TARGET_GENERIC_CFLAGS == TARGET_CPPFLAGS +
> TARGET_CFLAGS (like now) or something like that and make those package
> use that, after all it's the auto* packages that have issues with that.
> On the other hand it's a nice opportunity for some miscellaneous
> cleanups like using $(INSTALL) instead of install, removing redundant
> *_SOURCE definitions and stuff like that.
> Regards.

  TARGET_CPPFLAGS is _only_ used to set the largefile defines. So I think 
it's much easier to leave it out entirely, and pass those defines in 
CFLAGS. There may be one or two packages that break because they rely on 
correct CPPFLAGS, but for these we can send the largefile defines explicitly.

  So:

TARGET_LARGEFILE_CFLAGS = -D_LARGEFILE_SOURCE ...

TARGET_CFLAGS = $(TARGET_LARGEFILE_CFLAGS) ...

Remove the CPPFLAGS="$(TARGET_CPPFLAGS)" from TARGET_CONFIGURE_OPTS

Fixup the packages that use TARGET_CPPFLAGS


  HOST_CPPFLAGS is another story. It contains -I$(HOST_DIR)/usr/include. 
But that one _will_ trigger build failures if it is not passed correctly, 
so there Gustavo's patch is safe.

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
