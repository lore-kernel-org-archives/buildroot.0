From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 17 Nov 2019 20:28:28 +0100
Subject: [Buildroot] xorg with nodm/xdm init.d script conflicts causes
 blank screen
In-Reply-To: <348ab096ff9aeb8f448af5c8bddf15fdac9a61ed.camel@collabora.com>
References: <e18d5ea17ba0b23913db2136db94d67a@smartguide.com.au>
 <20190913194112.49f3fa68@windsurf.home>
 <348ab096ff9aeb8f448af5c8bddf15fdac9a61ed.camel@collabora.com>
Message-ID: <1f4aee0a-074a-dbfc-2d53-908b091501a5@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 13/09/2019 23:08, Ezequiel Garcia wrote:
> Hello everyone,
> 
> On Fri, 2019-09-13 at 19:41 +0200, Thomas Petazzoni wrote:
[snip]
>> So it means that starting /usr/bin/nodm in fact starts another X.org
>> server. I would have expected S40xorg to start the X.org server, and
>> then S90nodm to start the display manager inside the X.org server
>> started by S40xorg, but apparently it's not the case.
>>
> 
> Normally, display managers start X. E.g.:
> 
> gdm:
> https://github.com/GNOME/gdm/blob/master/daemon/gdm-server.c#L710
> 
> nodm:
> https://github.com/spanezz/nodm/blob/master/xserver.c#L159
[snip]
>> So if all display manager all start their own X.org server instance, it
>> means that perhaps S40xorg should only be installed if there's no
>> display manager enabled ?
[snip]
> When nodm was introduced, xorg-server didn't have the sysv init script.
> I assume it was added because Bernd needed to launch X without any session,
> but I don't truly understand the reasons for that route, as opposed to
> using a display manager. Or nodm, in case a fixed user login, no security
> is needed, as in a e.g. kiosk thing.
> 
> I haven't checked if it's possible, but I guess we can make some hidden
> config symbol PROVIDES_X_DISPLAY_MANAGER for display managers to select,
> and then use it to restrict the xorg server sysv init so it's available
> only if no display manager was selected.

 Indeed, the proper way is probably to create a virtual package for display
managers, make the different display managers implementations of that virtual
package, and install the xorg init script only when there is no display manager.

 The virtual package will also make sure that there is only 1 display manager.

 Regards,
 Arnout

> 
> Curious about the unfolding,
> Ezequiel
> 
>>> P.S. (As an aside, why don't more buildroot init scripts use 
>>> /etc/default config files?)
>>
>> Because we need more contributions to make our init scripts consistent
>> and use /etc/default config files! :-)
>>
>> Best regards,
>>
>> Thomas
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
