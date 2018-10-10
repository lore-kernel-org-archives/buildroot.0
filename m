From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 11 Oct 2018 00:04:31 +0200
Subject: [Buildroot] [PATCH 4/4] webkitgtk: explicitly set
 USE_GSTREAMER_GL build option
In-Reply-To: <20181010212630.7f47270e@windsurf>
References: <20181009220852.4309-1-aperez@igalia.com>
 <20181009220852.4309-5-aperez@igalia.com> <20181010212630.7f47270e@windsurf>
Message-ID: <973ec254-aef1-854f-c1ad-dfbe846c6fb1@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10/10/18 21:26, Thomas Petazzoni wrote:
> Hello,
> 
> On Wed, 10 Oct 2018 01:08:52 +0300, Adrian Perez de Castro wrote:
>> This covers the case where GL/GLES is available (so -DENABLE_OPENGL=ON
>> gets passed), which makes the webkitgtk build system assume GStreamer-GL
>> is available, while actually it is not.
>>
>> Also, use "imply" to select the needed GStreamer-GL component, because
>> in general it is preferred due to better performance.
>>
>> This fixes some autobuilder failures like the following:
>>
>>   http://autobuild.buildroot.net/results/187796535af53ece426641ff7d88aabada281674
> 
> What is fixing the autobuilder issue exactly? Explicitly disabling
> -DUSE_GSTREAMER_GL=OFF when the plugin is not available ? Or having it
> enabled by the "imply" ?

 imply doesn't really enable it, it just changes the default. It is the
equivalent of adding 'default y if BR2_PACKAGE_WEBKITGTK_MULTIMEDIA' to
BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_GL. So imply can never fix the issue.

> 
> In the former case, then I believe we need two patches: one fixing the
> autobuilder issue (i.e just the part in the .mk file) that we can
> backport to older Buildroot versions as needed, and another one adding
> the imply.

 Indeed, it should be split.

> 
> This usage of "imply" would be the first in Buildroot. Peter, Arnout,
> Yann, anything against it ?

 Absolute not, this is a great way to use imply.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
