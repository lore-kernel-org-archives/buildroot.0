From: Floris Bos <bos@je-eigen-domein.nl>
Date: Sat, 27 Dec 2014 18:43:40 +0100
Subject: [Buildroot] [PATCH 2/2] libvncserver: add config option for
 tightpng encoding support
In-Reply-To: <20141227145132.1c48523a@free-electrons.com>
References: <1419554775-11560-1-git-send-email-bos@je-eigen-domein.nl>	<1419554775-11560-2-git-send-email-bos@je-eigen-domein.nl>	<20141226180839.53e2df6f@free-electrons.com>	<b66fd2b4894b872b928f81fdf13998ec@to-the-max.net>
 <20141227145132.1c48523a@free-electrons.com>
Message-ID: <549EEFCC.9030202@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/27/2014 02:51 PM, Thomas Petazzoni wrote:
> Dear Floris Bos,
>
> On Fri, 26 Dec 2014 18:37:15 +0100, Floris Bos wrote:
>
>> JPEG and PNG are both necesarry.
>>
>> Libvncserver will only compile tight.c if HAVE_LIBJPEG
>>
>> https://github.com/LibVNC/libvncserver/blob/master/libvncserver/Makefile.am#L49
>>
>> And inside tight.c png is optional, jpeg is not.
> Ok, so I believe we should rather do:
>
> +config BR2_PACKAGE_LIBVNCSERVER_TIGHTPNG
> +	bool "TightPNG encoding support"
> +	select BR2_PACKAGE_JPEG
> +	select BR2_PACKAGE_LIBPNG
> +	help
> +	  TightPNG encoding speeds up HTML5 based VNC clients like noVNC.
> +
> +	  http://wiki.qemu.org/VNC_Tight_PNG
>
> in Config.in (i.e as you did)
>
> And then in libvncserver.mk, do:
>
> ifeq ($(BR2_PACKAGE_LIBPNG),y)
> LIBVNCSERVER_DEPENDENCIES += libpng
> else
> LIBVNCSERVER_CONF_OPTS += --without-png
> endif
>
> This way, people not using tightpng support but having libpng enabled
> will have PNG support in libvncserver.

Do note that the only thing using PNG inside libvncserver is the 
TightPNG encoding.
Think it is a bit counter-inductive to give users TightPNG support, just 
because another package selected libpng, even though they chose not to 
select the TightPNG feature.

(Just like I believe it is counter-inductive that users are expected to 
know which dependencies are needed to get a specific feature they want, 
as seems to be the current case with many buildroot packages, which do 
not offer any feature options).

-- 
Yours sincerely,

Floris Bos
