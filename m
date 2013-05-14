From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 14 May 2013 10:54:50 +0200
Subject: [Buildroot] [PATCH 1/6] package infra: remove CPPFLAGS from
	CFLAGS
In-Reply-To: <20130514091727.18efb29e@skate>
References: <1368463259-18958-1-git-send-email-gustavo@zacarias.com.ar>
 <20130513191016.15f0a3f4@skate> <51912140.8030901@zacarias.com.ar>
 <20130513202047.6bd6da1b@skate> <5191647F.6010408@zacarias.com.ar>
 <51917115.7090501@mind.be> <20130514091727.18efb29e@skate>
Message-ID: <5191FBDA.5090805@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14/05/13 09:17, Thomas Petazzoni wrote:
> Dear Arnout Vandecappelle,
>
> On Tue, 14 May 2013 01:02:45 +0200, Arnout Vandecappelle wrote:
>
>>    TARGET_CPPFLAGS is _only_ used to set the largefile defines. So I think
>> it's much easier to leave it out entirely, and pass those defines in
>> CFLAGS. There may be one or two packages that break because they rely on
>> correct CPPFLAGS, but for these we can send the largefile defines explicitly.
>>
>>    So:
>>
>> TARGET_LARGEFILE_CFLAGS = -D_LARGEFILE_SOURCE ...
>>
>> TARGET_CFLAGS = $(TARGET_LARGEFILE_CFLAGS) ...
>>
>> Remove the CPPFLAGS="$(TARGET_CPPFLAGS)" from TARGET_CONFIGURE_OPTS
>
> No, that's precisely the problem Gustavo had: newer autotools version
> do *NOT* want to have -D_BLABLA in CFLAGS, they only accept it in
> CPPFLAGS.
>
> See the original patch from Gustavo:
>
> """
> CPPFLAGS don't belong in CFLAGS, and newer autoconf versions just error
> out when it's used that way.
> """
>
> So the whole purpose of the discussion is precisely that we can't any
> longer pass the -D_LARGEFILE_SOURCE in TARGET_CFLAGS :)

  Okay my bad. I thought the issue was that CPPFLAGS were duplicated in 
CFLAGS.

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
