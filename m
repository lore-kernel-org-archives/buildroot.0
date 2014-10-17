From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 18 Oct 2014 00:15:17 +0200
Subject: [Buildroot] [PATCH v2 6/8] package/mpd: enable support for
	libnfs
In-Reply-To: <543FA48C.8040601@posteo.de>
References: <1413379134-28918-1-git-send-email-jkrause@posteo.de>	<1413379134-28918-6-git-send-email-jkrause@posteo.de>
 <20141016114439.6e09d052@free-electrons.com> <543FA48C.8040601@posteo.de>
Message-ID: <544194F5.3090001@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16/10/14 12:57, J?rg Krause wrote:
> Dear Thomas Petazzoni,
> 
> On 10/16/2014 11:44 AM, Thomas Petazzoni wrote:
>> Dear J?rg Krause,
[snip]
>>  *) $(STAGING_DIR)/usr/lib/pkgconfig is already the default search path
>>     for our pkg-config, so there should be no need to make this tuning.
>>     Which problem have you seen?
> 
> Without this mpd configuration check does not find libnfs although it is build
> successfully.
> 
>     checking for NFS... no
>     configure: error: NFS input plugin: libnfs not found

 Actually, we set PKG_CONFIG_LIBDIR to this directory, and PKG_CONFIG_PATH takes
precedence over PKG_CONFIG_LIBDIR. I have no idea why we do it that way... But
it means that if the package sets PKG_CONFIG_PATH to /usr/lib/pkg-config, it
will override our setting.

> 
> Maybe I should do this?:
>     MPD_MAKE_ENV = PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig"

 That looks better, indeed. Except, it should probably be MPD_CONF_ENV.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
