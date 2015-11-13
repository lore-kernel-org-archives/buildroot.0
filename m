From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 13 Nov 2015 10:00:43 +0100
Subject: [Buildroot] [PATCH] makefile: remove LD_LIBRARY_PATH from the
	environment
In-Reply-To: <5645853A.3040002@mind.be>
References: <1445722754-3477-1-git-send-email-mathstuf@gmail.com>
 <1446086895-28252-1-git-send-email-mathstuf@gmail.com>
 <5645853A.3040002@mind.be>
Message-ID: <2575CFBB-8407-4C1A-8DF7-CD555F677EC9@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On November 13, 2015 7:37:46 AM GMT+01:00, Arnout Vandecappelle <arnout@mind.be> wrote:
>On 29-10-15 03:48, Ben Boeckel wrote:
>> If system tools are selected, the host's lib/ directory may shadow
>> libraries from the system which are configured differently and do not
>> have all of the symbols required by the system tool.
>> 
>> Since buildroot uses rpath everywhere, LD_LIBRARY_PATH should not be
>> necessary anyways.
>> 
>> Signed-off-by: Ben Boeckel <mathstuf@gmail.com>
>
>Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>
>As I mentioned in a discussion with Yann (don't remember if it was on
>IRC or on
>the list), I think we should apply this now no master to see what the
>autobuilders say. We currently break the build on Fedora 23 for any
>configuration including libattr, which IMHO is worse than the (probably
>small)
>number of host-tools that are missing rpath.
>
>If we apply this patch _now_, we still have a few weeks to look at
>autobuild
>results and handle the fallout.
>
>Note that all the host tools that are mentioned in Config.in.host will
>have to
>be tested manually. Anybody up for that? Also the boot loaders will
>have to be
>tested manually since they're not handled by the autobuilders.
>
> Regards,
> Arnout
>
>> ---
>>  package/Makefile.in | 2 --
>>  1 file changed, 2 deletions(-)
>> 
>> diff --git a/package/Makefile.in b/package/Makefile.in
>> index 8a592d4..10f3a47 100644
>> --- a/package/Makefile.in
>> +++ b/package/Makefile.in
>> @@ -298,12 +298,10 @@ HOST_CONFIGURE_OPTS = \
>>  	PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
>>  	PKG_CONFIG_SYSROOT_DIR="/" \
>> 
>	PKG_CONFIG_LIBDIR="$(HOST_DIR)/usr/lib/pkgconfig:$(HOST_DIR)/usr/share/pkgconfig"
>\
>> -	LD_LIBRARY_PATH="$(HOST_DIR)/usr/lib$(if
>$(LD_LIBRARY_PATH),:$(LD_LIBRARY_PATH))" \
>>  	INTLTOOL_PERL=$(PERL)
>>  
>>  HOST_MAKE_ENV = \
>>  	PATH=$(BR_PATH) \
>> -	LD_LIBRARY_PATH="$(HOST_DIR)/usr/lib$(if
>$(LD_LIBRARY_PATH),:$(LD_LIBRARY_PATH))" \
>>  	PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
>>  	PKG_CONFIG_SYSROOT_DIR="/" \
>>  	PKG_CONFIG_LIBDIR="$(HOST_DIR)/usr/lib/pkgconfig"
>> 
>
>
>-- 
>Arnout Vandecappelle                          arnout at mind be
>Senior Embedded Software Architect            +32-16-286500
>Essensium/Mind                                http://www.mind.be
>G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
>LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
>GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
>_______________________________________________
>buildroot mailing list
>buildroot at busybox.net
>http://lists.busybox.net/mailman/listinfo/buildroot

Ben, Arnout, All,

NAK for this one is the current state.

I have been working on it in the past few days (current branch not pushed, I'm away... Will push tonight):
http://git.buildroot.org/~ymorin/git/buildroot/log/?h=yem/no-ld-library-path

We still have packages that are missing the rpath, but that's not the only issue.

Look at libcurl: we're fiddling with LD_LIBRARY_PATH. Since we're setting it today, it is not empty. But if we no longer set it, we'd have the current directory in it (see the dependency check we do on it too for info).

So we should at least fix the known issues first, which I'm working on... More on this tonight when I land back home...

Regards,
Yann E. MORIN (on the move).
-- 
Sent from my Android device with K-9 Mail. Please excuse my brevity.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151113/270389b1/attachment.html>
