From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Wed, 21 Mar 2012 10:24:02 +0100
Subject: [Buildroot] [PATCH 6/6] Add systemd unit for lighttpd
In-Reply-To: <201203200055.22903.arnout@mind.be>
References: <cover.1332172636.git.maxime.ripard@free-electrons.com>
 <b405dff28f234161c91302a003a361dd3e162a11.1332172636.git.maxime.ripard@free-electrons.com>
 <201203200055.22903.arnout@mind.be>
Message-ID: <4F699E32.7040400@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 20/03/2012 00:55, Arnout Vandecappelle a ?crit :
> On Monday 19 March 2012 16:59:40 Maxime Ripard wrote:
>> +define LIGHTTPD_INSTALL_INIT_SYSTEMD
>> +[ -f $(TARGET_DIR)/etc/systemd/system/lighttpd.service ] || \
>> +       $(INSTALL) -D -m 755 package/lighttpd/lighttpd.service \
>> +               $(TARGET_DIR)/etc/systemd/system/lighttpd.service
>> +
>> +mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
>> +
>> +ln -fs ../lighttpd.service \
>> +       $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/lighttpd.service
>> +endef
> 
>  This should be indented, no?
> 
>  Would it be useful to add this to generic package infrastructure?
> I mean, if systemd is selected and pkgdir/pkgname.service exists,
> install it and enable it in multi-user.

I thought so at first, and in my first proposal, that was indeed the
case, but fact is that not every package doesn't want to be in
multi-user targets, but some will want to be in the sockets one, other
in network, etc.

So that's the reason I only added callbacks and let it up to the package
to install its units where they should be.


-- 
Maxime Ripard, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
