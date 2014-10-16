From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 16 Oct 2014 11:42:45 +0200
Subject: [Buildroot] [PATCH v3] cppunit: Added package
In-Reply-To: <20141016110834.0410d5ce@free-electrons.com>
References: <1413404565-16362-1-git-send-email-sebastien.bourdelin@savoirfairelinux.com>	<543F8710.4010708@mind.be>
 <20141016110834.0410d5ce@free-electrons.com>
Message-ID: <543F9315.3010104@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16/10/14 11:08, Thomas Petazzoni wrote:
> Dear Arnout Vandecappelle,
> 
> On Thu, 16 Oct 2014 10:51:28 +0200, Arnout Vandecappelle wrote:
> 
>>  Unfortunately, it fails to build for platforms without shared libraries (e.g.
>> blackfin FLAT). Probably easy to fix (seems to be a case of some forgotten
>> #ifdef's), but it's easier to just add
>>
>> 	depends on !BR2_BINFMT_FLAT
> 
> No: if it's really related to shared libraries, then it should be a
> depends on !BR2_PREFER_STATIC_LIB.

 Yeah, you're probably right. It does build with PREFER_STATIC on other
architectures, but that's just because there still is a dlopen in staging so it
still sets CPPUNIT_HAVE_LIBDL and then it builds "correctly". But we most likely
have many many packages that seem to build correctly with STATIC but actually
still use shared libraries or dlopen. We probably should remove ld.so and
libdl.* from staging when building static.

 So yes, better make it !STATIC, with a comment explaining that it doesn't
correctly detect the static situation and that there is a trivial build failure
when CPPUNIT_HAVE_LIBDL is disabled.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
