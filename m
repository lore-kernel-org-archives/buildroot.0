From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Mon, 16 Oct 2017 19:01:08 +0200
Subject: [Buildroot] [RFC 1/4] package/go: fixing crosscompilation
	settings
In-Reply-To: <20171016165641.GD2862@scaer>
References: <1507207260-26734-1-git-send-email-angelo.compagnucci@gmail.com>
 <20171016165641.GD2862@scaer>
Message-ID: <CA+TH9VnmsiVvci219jy57x8OyWwb6Z-tf-zPMRy2egvDFfqXbg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann,

2017-10-16 18:56 GMT+02:00 Yann E. MORIN <yann.morin.1998@free.fr>:
> Angelo, All,
>
> On 2017-10-05 14:40 +0200, Angelo Compagnucci spake thusly:
>> This patch fixes a bug with the BR2_TOOLCHAIN_HAS_THREADS variable
>> handling which causes CGO_ENABLED to be always 0.
>>
>> Furthermore, it fixes the cross compilation options for the go compiler:
>> setting CGO_ENABLED should be done only for the target compiler not the
>> host one.
>>
>> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
>> ---
>>  package/go/go.mk | 14 ++++++++------
>>  1 file changed, 8 insertions(+), 6 deletions(-)
>>
>> diff --git a/package/go/go.mk b/package/go/go.mk
>> index 0781dff..8e510e7 100644
>> --- a/package/go/go.mk
>> +++ b/package/go/go.mk
>> @@ -52,7 +52,7 @@ HOST_GO_TARGET_ENV = \
>>  # set, build in cgo support for any go programs that may need it.  Note that
>>  # any target package needing cgo support must include
>>  # 'depends on BR2_TOOLCHAIN_HAS_THREADS' in its config file.
>> -ifeq (BR2_TOOLCHAIN_HAS_THREADS,y)
>> +ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
>
> Indeed... Wonderfull that it passed through the cracks and stayed
> unnoticed so far...

We haven't right now in buildroot a software that really needs cgo. I'm
working with mender and noticed this bug straight.

>
>>  HOST_GO_CGO_ENABLED = 1
>>  else
>>  HOST_GO_CGO_ENABLED = 0
>> @@ -74,8 +74,8 @@ HOST_GO_MAKE_ENV = \
>>       GOARCH=$(GO_GOARCH) \
>>       $(if $(GO_GOARM),GOARM=$(GO_GOARM)) \
>>       GOOS=linux \
>> -     CGO_ENABLED=$(HOST_GO_CGO_ENABLED) \
>> -     CC=$(HOSTCC_NOCCACHE)
>> +     CC=$(HOSTCC_NOCCACHE) \
>> +     CXX=$(HOSTCXX_NOCCACHE)
>>
>>  HOST_GO_TARGET_CC = \
>>       CC_FOR_TARGET="$(TARGET_CC)" \
>> @@ -83,16 +83,18 @@ HOST_GO_TARGET_CC = \
>>
>>  HOST_GO_HOST_CC = \
>>       CC_FOR_TARGET=$(HOSTCC_NOCCACHE) \
>> -     CXX_FOR_TARGET=$(HOSTCC_NOCCACHE)
>> +     CXX_FOR_TARGET=$(HOSTCXX_NOCCACHE)
>>
>>  HOST_GO_TMP = $(@D)/host-go-tmp
>>
>>  define HOST_GO_BUILD_CMDS
>> -     cd $(@D)/src && $(HOST_GO_MAKE_ENV) $(HOST_GO_HOST_CC) ./make.bash
>> +     cd $(@D)/src && $(HOST_GO_MAKE_ENV) $(HOST_GO_HOST_CC) \
>> +             CGO_ENABLED=0 ./make.bash
>
> Can we use a more logical location to split the line (I don't care if
> the second line is indented or not, but usually we do indent it):

Will do

>
>     cd $(@D)/src && \
>     $(HOST_GO_MAKE_ENV) $(HOST_GO_HOST_CC) CGO_ENABLED=0 ./make.bash
>
>>       mkdir -p $(HOST_GO_TMP)
>>       mv $(@D)/pkg/tool $(HOST_GO_TMP)/
>>       mv $(@D)/bin/ $(HOST_GO_TMP)/
>> -     cd $(@D)/src && $(HOST_GO_MAKE_ENV) $(HOST_GO_TARGET_CC) ./make.bash
>> +     cd $(@D)/src && $(HOST_GO_MAKE_ENV) $(HOST_GO_TARGET_CC) \
>> +             CGO_ENABLED=$(HOST_GO_CGO_ENABLED) ./make.bash
>
> Ditto?

Will do.

>
> Otherwise looks good:
>
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> Can go in, even without the rest of the series, I think, no?

Yes, no problem. For packages without cgo enabled don't change anything.

>
> Regards,
> Yann E. MORIN.
>
>>  endef
>>
>>  define HOST_GO_INSTALL_CMDS
>> --
>> 2.7.4
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
