From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 2 Apr 2018 17:39:45 +0200
Subject: [Buildroot] [PATCH 2/3] netcf: new package
In-Reply-To: <20180402164233.76d04a17@windsurf>
References: <20171127104131.27975-1-casantos@datacom.ind.br>
 <20171127104131.27975-3-casantos@datacom.ind.br>
 <20180402164233.76d04a17@windsurf>
Message-ID: <3f89f95b-661c-86d8-18c9-49f0d6736dd7@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 02-04-18 16:42, Thomas Petazzoni wrote:
> Hello Carlos,
> 
> On Mon, 27 Nov 2017 08:41:30 -0200, Carlos Santos wrote:
[snip]
>> +NETCF_CONF_OPTS = \
>> +	--with-sysinit=$(if $(BR2_INIT_SYSTEMD),systemd,$(if $(BR2_INIT_NONE),none,initscripts))
> 
> This is a bit hard to read.
> 
> ifeq ($(BR2_INIT_SYSTEMD),y)
> NETCF_CONF_OPTS += --with-sysinit=systemd
> else ifeq ($(BR2_INIT_BUSYBOX)$(BR2_INIT_SYSV),y)
> NETCF_CONF_OPTS += --with-sysinit=sysv
> else
> NETCF_CONF_OPTS += --with-sysinit=none
> endif

 However, since the upstream sysv init script is pretty complicated and must be
patched anyway, it would make sense to always use our own, and in that case it
would be

ifeq ($(BR2_INIT_SYSTEMD),y)
NETCF_CONF_OPTS += --with-sysinit=systemd
else
# For SysV init we use our own init script
NETCF_CONF_OPTS += --with-sysinit=none
endif


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
