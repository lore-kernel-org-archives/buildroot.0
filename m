From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Wed, 15 May 2019 11:42:12 +0200
Subject: [Buildroot] [PATCH 1/1] package/brotli: fix build on microblaze
 with -02
In-Reply-To: <20190515122718.GB6334@momiji>
References: <20190514211526.26467-1-fontaine.fabrice@gmail.com>
 <20190515122718.GB6334@momiji>
Message-ID: <e214d7bb-e9b1-af4d-8143-0641a9e45758@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All, Arnout, Thomas,

Il 15/05/2019 11:27, Adrian Perez de Castro ha scritto:
> Hi,
> 
> On Tue, 14 May 2019 23:15:26 +0200, Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>> Fixes:
>>   - http://autobuild.buildroot.org/results/4790c30b75cdec18f67cda9c6afcb6971ee27608
>>
>> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> 
> Reviewed-by: Adrian Perez de Castro <aperez@igalia.com>
> 
>> ---
>>   package/brotli/brotli.mk | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/package/brotli/brotli.mk b/package/brotli/brotli.mk
>> index 2c1ad48753..4afd3628a8 100644
>> --- a/package/brotli/brotli.mk
>> +++ b/package/brotli/brotli.mk
>> @@ -14,4 +14,11 @@ BROTLI_CONF_OPTS = \
>>   	-DBROTLI_DISABLE_TESTS=ON \
>>   	-DBROTLI_BUNDLED_MODE=OFF
>>   
>> +# prevents from triggering GCC ICE
>> +# A bug was reported to the gcc bug tracker:
>> +# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68485
>> +ifeq ($(BR2_microblaze),y)
>> +BROTLI_CONF_OPTS += -DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -O0"
>> +endif
> 
> This is not a great fix, but still better than not being able to build the
> package at all, so I think it's okay to merge it. ?\_(?)_/?

This is another package added to the list of Microblaze GCC6/7 bug 85180.
List now is:
- atop
- flare-engine
- boost
- gst-ffmpeg
- glibmm
- qt5sensors
- (and this) brotli

I don't think this is the way to solve it. I mean, it would be ok for 
-O0, but at this point I'm going to make a patch that impose it at 
toolchain's Config.in, otherwise we need to wait every package to fail 
and patch it.

Another easier way is what Arnout suggested here:
http://lists.busybox.net/pipermail/buildroot/2019-May/250212.html

What I'm going to can check today is if there's a common fix for C and 
C++ compilation.
And it seems at the moment to be using -O0.

What about the 2 choices?

-- 
Giulio Benetti
CTO

MICRONOVA SRL
Sede: Via A. Niedda 3 - 35010 Vigonza (PD)
Tel. 049/8931563 - Fax 049/8931346
Cod.Fiscale - P.IVA 02663420285
Capitale Sociale ? 26.000 i.v.
Iscritta al Reg. Imprese di Padova N. 02663420285
Numero R.E.A. 258642

>>   $(eval $(cmake-package))
>> -- 
>> 2.20.1
>>
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
