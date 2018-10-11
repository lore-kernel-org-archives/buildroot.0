From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 11 Oct 2018 23:56:36 +0200
Subject: [Buildroot] [PATCH 4/4] webkitgtk: explicitly set
 USE_GSTREAMER_GL build option
In-Reply-To: <20181011192343.GA31509@scaer>
References: <20181009220852.4309-1-aperez@igalia.com>
 <20181009220852.4309-5-aperez@igalia.com> <20181010212630.7f47270e@windsurf>
 <20181010202425.GN2869@scaer> <40fb0474-283f-4b73-78e6-45ea99a1bb65@mind.be>
 <87in281h7o.fsf@dell.be.48ers.dk> <20181011192343.GA31509@scaer>
Message-ID: <b93c6915-8190-c39a-9251-d2530d8e136d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 11/10/18 21:23, Yann E. MORIN wrote:
> Peter, Arnout, All,
> 
> On 2018-10-11 20:16 +0200, Peter Korsgaard spake thusly:
>>>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
>>  >  'imply' is syntactic sugar for 'default y if ...'. The *only* thing it changes
>>  > is the place where you put the imply. (To be exact, it is the same as 'default
>>  > ...' because it propagates the m/y/n state to the default, not just y/n. But
>>  > since we don't use m, it doesn't matter.)
>>
>>  >  For this specific case, it is pretty obvious that putting a 'default y if
>>  > BR2_PACKAGE_WEBKITGTK_MULTIMEDIA' on BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_GL
> 
> As the submitter said "in general it is preferred due to better
> performance", why don't we just have, in webkitgtk:
> 
>     select BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_GL if BR2_PACKAGE_GST1_PLUGINS_BAD
> 
> Or even further:
> 
>     select BR2_PACKAGE_GST1_PLUGINS_BAD
>     select BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_GL
> 
> Of course, that requires propagating the required dependencies...
> But since webkitgtk already depends on libgtk3, which itself depends on
> LIBEGL_WAYLAND or LIBGL, we're not too far off...

 For this specific case, that's a very good idea indeed. Something like (to be
tested!):

config BR2_PACKAGE_WEBKITGTK_MULTIMEDIA
        bool "multimedia support"
        select BR2_PACKAGE_GSTREAMER1
        select BR2_PACKAGE_GST1_PLUGINS_BAD
        select BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_GL if
BR2_PACKAGE_GST1_PLUGINS_BASE_HAS_LIB_OPENGL
        ...

 Ideally we would also select the plugins that make sure HAS_LIB_OPENGL becomes
true, but unfortunately that's really complicated. Selecting
BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL would help, but that has the
disadvantage that it might not actually make the GL plugin available (depending
on the state of X11/wayland/...

> 
>>  > would be crazy. On the other hand, adding the imply in webkitgtk looks nice,
>>  > concise and clear.
> 
> Sorry, I am still not convinced that using 'imply' in Buildroot is a
> good idea overall... :-(
> 
>> Exactly, which is why I suggested it to Adrian.

 Apparently our BDFL disagrees :-)


 Regards,
 Arnout

> On the other hand, this is webkitgtk we're speaking here. It's already
> huge, really huge. What would be the problem with 'select'ing
> GST1_PLUGINS_BAD_PLUGIN_GL if it is known to be the 'best' solution
> (even if not strictly required) ?
> 
> But I'm done speaking about it now.
> 
> Regards,
> Yann E. MORIN.
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
