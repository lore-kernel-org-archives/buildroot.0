From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 6 Sep 2016 00:32:13 +0200
Subject: [Buildroot] [PATCH 1/2] package/ffmpeg: opencv2 support is
 broken if BR2_ARM_ENABLE_VFP is enabled
In-Reply-To: <8f363a01-6a59-623b-4f81-0108feefa367@mind.be>
References: <20160905145120.8613-1-bernd.kuhls@t-online.de>
 <20160905220540.633a3cd4@free-electrons.com>
 <8f363a01-6a59-623b-4f81-0108feefa367@mind.be>
Message-ID: <f30e019a-3b59-d552-4519-28f000d85dbb@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 06-09-16 00:22, Arnout Vandecappelle wrote:
> 
> 
> On 05-09-16 22:05, Thomas Petazzoni wrote:
>> Hello,
>>
>> On Mon,  5 Sep 2016 16:51:19 +0200, Bernd Kuhls wrote:
>>> Fixes
>>> http://autobuild.buildroot.net/results/c32/c32a21240a9933796ee850349a62ff3c2314f25c/
>>> http://autobuild.buildroot.net/results/22a/22a9769d83d2a398bb6b264d342b2077c41c9cc5/
>>>
>>> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
>>> ---
>>>  package/ffmpeg/ffmpeg.mk | 3 ++-
>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
>>> index a90d437..74f783c 100644
>>> --- a/package/ffmpeg/ffmpeg.mk
>>> +++ b/package/ffmpeg/ffmpeg.mk
>>> @@ -250,7 +250,8 @@ endif
>>>  
>>>  # To avoid a circular dependency only use opencv if opencv itself does
>>>  # not depend on ffmpeg.
>>> -ifeq ($(BR2_PACKAGE_OPENCV_LIB_IMGPROC)x$(BR2_PACKAGE_OPENCV_WITH_FFMPEG),yx)
>>> +# opencv2 is broken if BR2_ARM_ENABLE_VFP is enabled
>>> +ifeq ($(BR2_PACKAGE_OPENCV_LIB_IMGPROC)x$(BR2_PACKAGE_OPENCV_WITH_FFMPEG)x$(BR2_ARM_ENABLE_VFP),yxx)
>>
>> I'm not really happy with this fix. When you're using OpenCV/FFmpeg on
>> ARM, you definitely want to be able to use the VFP. So I'd prefer to
>> see the problem fixed rather than having this combination disabled.
> 
>  Well, since there is now the possibility to use opencv3 instead, which has
> fixed the issue, I think this isn't much of a problem, no?

 But actually, isn't it just a matter of replacing asm with __asm__? ffmpeg
compiles with -std=c99 so asm doesn't exist.

 I don't have time to try it now, time to go to sleep ;-)

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
