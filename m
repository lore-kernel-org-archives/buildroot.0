From: =?ISO-8859-1?Q?Fran=E7ois_Perrad?= <francois.perrad@gadz.org>
Date: Fri, 28 Feb 2014 09:22:31 +0100
Subject: [Buildroot] [PATCH 05/24] luajit: refactor without
	shared-lib.patch
In-Reply-To: <CAHXCMMLud0oSuXB1L01GiPv68SCK-7omOQjL6gSzVHvHD3kJSQ@mail.gmail.com>
References: <1393227301-14874-1-git-send-email-francois.perrad@gadz.org>
 <1393227301-14874-6-git-send-email-francois.perrad@gadz.org>
 <CAHXCMMLud0oSuXB1L01GiPv68SCK-7omOQjL6gSzVHvHD3kJSQ@mail.gmail.com>
Message-ID: <CAB0FRstTSDCjhg7SsPqGd4TGONwJWLfJ2dwT1KwqppLP3JAF=Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2014-02-27 10:05 GMT+01:00 Samuel Martin <s.martin49@gmail.com>:
> Hi Francois,
>
> On Mon, Feb 24, 2014 at 8:34 AM, Francois Perrad <fperrad@gmail.com> wrote:
>> the variable BUILDMODE does the job
>>
>> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
>> ---
>>  package/luajit/luajit-02-shared-lib.patch |   17 -----------------
>>  package/luajit/luajit.mk                  |    1 +
>>  2 files changed, 1 insertion(+), 17 deletions(-)
>>  delete mode 100644 package/luajit/luajit-02-shared-lib.patch
>>
>> diff --git a/package/luajit/luajit-02-shared-lib.patch b/package/luajit/luajit-02-shared-lib.patch
>> deleted file mode 100644
>> index 361e5c2..0000000
>> --- a/package/luajit/luajit-02-shared-lib.patch
>> +++ /dev/null
>> @@ -1,17 +0,0 @@
>> -Compile the luajit binary dynamically against the luajit library
>> -
>> -Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>> -
>> -Index: b/src/Makefile
>> -===================================================================
>> ---- a/src/Makefile
>> -+++ b/src/Makefile
>> -@@ -669,7 +669,7 @@
>> -
>> - $(LUAJIT_T): $(TARGET_O) $(LUAJIT_O) $(TARGET_DEP)
>> -       $(E) "LINK      $@"
>> --      $(Q)$(TARGET_LD) $(TARGET_ALDFLAGS) -o $@ $(LUAJIT_O) $(TARGET_O) $(TARGET_ALIBS)
>> -+      $(Q)$(TARGET_LD) $(TARGET_ALDFLAGS) -o $@ $(LUAJIT_O) -lluajit -L. $(TARGET_ALIBS)
>> -       $(Q)$(TARGET_STRIP) $@
>> -       $(E) "OK        Successfully built LuaJIT"
>> -
>> diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
>> index 186b3fd..01fbb78 100644
>> --- a/package/luajit/luajit.mk
>> +++ b/package/luajit/luajit.mk
>> @@ -44,6 +44,7 @@ define LUAJIT_BUILD_CMDS
>>                 HOST_CFLAGS="$(HOST_CFLAGS)" \
>>                 HOST_LDFLAGS="$(HOST_LDFLAGS)" \
>>                 $(LUAJIT_NO_LARGEFILE) \
>> +               BUILDMODE=dynamic \
>
> AFAICS, luajit can be selected if BR2_PREFER_STATIC_LIB=y.
> How does this play in such a case?
>

I'll add a patch "luajit: handles BR2_PREFER_STATIC_LIB",
at this time, the dynamic variant is always built.

Fran?ois

> Regards,
>
>
> --
> Samuel
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
