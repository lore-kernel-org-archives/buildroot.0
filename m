From: grepper <grepper@gmail.com>
Date: Tue, 16 Jun 2015 14:27:23 -0400
Subject: [Buildroot] [PATCH 1/1] Allow imagemagick to find ghostscript
 fonts.
In-Reply-To: <20150616033946.GY8165@tarshish>
References: <1434420746-20199-1-git-send-email-grepper@gmail.com>
 <20150616033946.GY8165@tarshish>
Message-ID: <55806A8B.5090302@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15/06/15 11:39 PM, Baruch Siach wrote:
> Hi Robert,
> 
> On Mon, Jun 15, 2015 at 10:12:26PM -0400, grepper wrote:
>> From: Robert Sohn <grepper@gmail.com>
>>
>> It appears that Imagemagick needs to be configured with
>>  --with-gs-font-dir=/usr/share/fonts/gs else it will not find
>> the ghostscript fonts and /etc/ImageMagick-6/type-ghostscript.xml
>> will contain the wrong font paths. You end up with messages like:
>> Magick: unable to read font `(null)' @ error/annotate.c/RenderFreetype/1153
>> They are non-fatal but could get annoying fast if you are using 'convert'
>> on a lot of files.
>>
>> Signed-off-by: Robert Sohn <grepper@gmail.com>
>> ---
>>  package/imagemagick/imagemagick.mk | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
>> index 298d0a8..1abb2a8 100644
>> --- a/package/imagemagick/imagemagick.mk
>> +++ b/package/imagemagick/imagemagick.mk
>> @@ -33,7 +33,8 @@ IMAGEMAGICK_CONF_OPTS = \
>>  	--without-dps \
>>  	--without-gslib \
>>  	--without-fpx \
>> -	--without-x
>> +	--without-x \
>> +	--with-gs-font-dir=/usr/share/fonts/gs
> 
> These fonts are only available when the ghostscript-fonts is built, isn't it? 
> If so, then this should be
> 
> ifeq ($(BR2_PACKAGE_GHOSTSCRIPT_FONTS),y)
> IMAGEMAGICK_CONF_OPTS += --with-gs-font-dir=/usr/share/fonts/gs
> endif
> 
> Or maybe we should use $(GHOSTSCRIPT_FONTS_TARGET_DIR) here, instead of 
> duplicating it?
> 
> baruch
> 

Hm, the problem is that the issue will remain if ghostscript-fonts are
not installed. I don't know the solution to that. It seems strange that
imagemagick can not find a default font when 'convert -list font' shows
many, ttf and otherwise.

Robert
