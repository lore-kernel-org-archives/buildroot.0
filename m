From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 14 Oct 2016 16:04:11 +0200
Subject: [Buildroot] qt5webkit: host-python dependency issue in Python3
 environment
In-Reply-To: <20161014155700.583f6e14@free-electrons.com>
References: <CAGm1_ktbKzd7jbaTRryp27yZF94HMPZnZTfMw+sC1vCC8-mVvA@mail.gmail.com>
 <20161014155700.583f6e14@free-electrons.com>
Message-ID: <e9d3d452-ed9e-612e-ddc2-f6d73666226e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 14-10-16 15:57, Thomas Petazzoni wrote:
> Hello,
> 
> On Fri, 14 Oct 2016 09:53:53 +0200, Yegor Yefremov wrote:
>> My project uses both Python3 and Qt5 including qt5webkit package. The
>> problem in this particular constellation is, that
>> output/target/usr/bin/python is a symlink to
>> output/host/usr/bin/python2.
> 
> Hu? target/usr/bin/python is a symlink to host/usr/bin/python2 ? Are
> you sure ? If so, this is the problem, not the qt5webkit dependency on
> host-python.
> 
> If you have a Python 3 enabled system, and qt5webkit is enabled, you
> should have the following situation:
> 
>  - target/usr/bin/python -> target/usr/bin/python3
>  - host/usr/bin/python -> host/usr/bin/python3
>  - host/usr/bin/python2
> 
> I.e, Python 3 is the "default" version, but Python 2 for the host is
> also available, if called explicitly using host/usr/bin/python2.
> 
> So, I don't understand your original problem.

 As reported by Johan Derycke in a different thread:

> I think there is an issue with this patch.
> 
> We make a link in $(@D)/bin/python:
> 
> define QT5WEBKIT_PYTHON2_SYMLINK
>   echo  $(@D)
>   mkdir -p $(@D)/bin
>   ln -sf $(HOST_DIR)/usr/bin/python2 $(@D)/bin/python
> endef
> 
> 
> But QT5WEBKIT_INSTALL_TARGET_CMDS copies $(@D)/bin/python to the target dir:
> 
> define QT5WEBKIT_INSTALL_TARGET_CMDS
>   cp -dpf $(STAGING_DIR)/usr/lib/libQt5WebKit*.so.* $(TARGET_DIR)/usr/lib
>   cp -dpf $(@D)/bin/* $(TARGET_DIR)/usr/bin/
>   $(QT5WEBKIT_INSTALL_TARGET_QMLS)
> endef
> 
> This overwrites the target python link with a bogus one.
> 
> The bin folder only contains 'jsc' which don't need. So removing the cp solves it for me.

 jsc is a command-line standalone javascript executor, which is used for webkit
tests. It's not really meant for anything else though it _could_ be used to do
some kind of simplified node.js. So we could either copy just jsc, or not copy
anything from the bin directory at all. Alternatively, use a different subdir of
$(@D), e.g. $(@D)/host-python-bin.

 Yegor or Johan, care to submit a patch that takes either of these approaches?


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
