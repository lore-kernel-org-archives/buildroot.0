From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 31 Mar 2015 20:11:45 +0200
Subject: [Buildroot] [PATCH 1/1] allow xserver without the systemd login
 daemon.
In-Reply-To: <20150329150827.4491e5d4@free-electrons.com>
References: <1427548538-7789-1-git-send-email-sagaert.johan@proximus.be>
 <20150329150827.4491e5d4@free-electrons.com>
Message-ID: <551AE361.5030703@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 29/03/15 15:08, Thomas Petazzoni wrote:
> Dear Sagaert Johan,
> 
> On Sat, 28 Mar 2015 14:15:38 +0100, Sagaert Johan wrote:
>> Thanks to Noel Vellemans for the hint.
>> Signed-off-by: Sagaert Johan <sagaert.johan@proximus.be>
>> ---
>>  package/x11r7/xserver_xorg-server/xserver_xorg-server.mk | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
>> index bb5381c..db2e653 100644
>> --- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
>> +++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
>> @@ -64,6 +64,11 @@ XSERVER_XORG_SERVER_CONF_OPTS = \
>>  	--with-fontrootdir=/usr/share/fonts/X11/ \
>>  	--$(if $(BR2_PACKAGE_XSERVER_XORG_SERVER_XVFB),en,dis)able-xvfb
>>  
>> +ifneq ($(BR2_INIT_SYSTEMD),y)
>> +	XSERVER_XORG_SERVER_CONF_OPTS += \
>> +	--disable-systemd-logind
>> +endif
> 
> This seems good, but I'd like to see a more complete solution, that
> takes care of both --{enable,disable}-systemd-login and
> --{with,without}-systemd-daemon.
> 
> You should pass both the enabling and disabling options, and use
> BR2_PACKAGE_SYSTEMD for the condition.
> 
> I believe something like:
> 
> ifeq ($(BR2_PACKAGE_SYSTEMD),y)
> XSERVER_XORG_CONF_OPTS += \
> 	--with-systemd-daemon \
> 	--enable-systemd-logind

 And also

XSERVER_XORG_DEPENDENCIES += systemd

(configure does pkg-config check for libsystemd-daemon)


 Regards,
 Arnout

> else
> XSERVER_XORG_CONF_OPTS += \
> 	--without-systemd-daemon \
> 	--disable-systemd-logind
> endif
> 
> would be more appropriate, but I'd like to have some feedback from a
> X.org person. Bernd, can you comment on this?
> 
> Thanks,
> 
> Thomas
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
