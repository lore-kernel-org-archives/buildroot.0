From: Mauro Condarelli <mc5686@mclink.it>
Date: Thu, 6 Aug 2015 23:49:34 +0200
Subject: [Buildroot] [PATCH] imagemagick depends on pango even if not
 available
In-Reply-To: <20150806224829.61effbfa@free-electrons.com>
References: <55C3A446.8080307@mclink.it>
 <20150806224829.61effbfa@free-electrons.com>
Message-ID: <55C3D66E.9060707@mclink.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
AFAIK pango is not mandatory to compile imagemagick, but without this patch imagemagick package would fail compilation if pango is not selected (either directly or because of other dependencies).
I.e.: to compile without pango it seem mandatory to explicitly pass " --without-pango" to imagemaagick's configure script; so we have two possibilities: either automatically select pango or do something along the lines of my patch (shamelessly adapted from other stances in imagemagick.mk).
Does this clarify or did I misunderstand You?

Regards
Mauro Condarelli

Il 06/08/2015 22:48, Thomas Petazzoni ha scritto:
> Dear Mauro Condarelli,
>
> Thanks for your contribution! See below for some comments/questions.
>
> On Thu, 6 Aug 2015 20:15:34 +0200, Mauro Condarelli wrote:
>> Hi,
>> it seems imagemagick package does not force dependency on pango, but fails if it's not found.
> Can you give more details on how it fails?
>
>> $ git diff
>> diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
>> index 1594f69..e8c7ab7 100644
>> --- a/package/imagemagick/imagemagick.mk
>> +++ b/package/imagemagick/imagemagick.mk
>> @@ -44,6 +44,13 @@ else
>>    IMAGEMAGICK_CONF_OPTS += --without-fontconfig
>>    endif
>>
>> +ifeq ($(BR2_PACKAGE_PANGO),y)
>> +IMAGEMAGICK_CONF_OPTS += --with-pango
>> +IMAGEMAGICK_DEPENDENCIES += pango
>> +else
>> +IMAGEMAGICK_CONF_OPTS += --without-pango
>> +endif
> This patch is not making pango a mandatory dependency of imagemagick.
> It only makes it an optional dependency;
>
> Again, can you give more details about the problem you're seeing?
>
> The patch looks good (i.e pango is an optional dependency of
> imagemagick), but the description is not. Can you clarify?
>
> Thanks!
>
> Thoma
>
