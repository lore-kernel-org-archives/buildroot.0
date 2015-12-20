From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 20 Dec 2015 16:49:02 +0100
Subject: [Buildroot] [PATCH 1/2] package/wireshark: Fix libpcap detection
In-Reply-To: <20151220124957.GA3677@free.fr>
References: <1449998185-15082-1-git-send-email-bernd.kuhls@t-online.de>
 <566DDC20.5000104@mind.be> <20151220124957.GA3677@free.fr>
Message-ID: <5676CDEE.10206@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20-12-15 13:49, Yann E. MORIN wrote:
> Arnout, All,
> 
> On 2015-12-13 21:59 +0100, Arnout Vandecappelle spake thusly:
>> On 13-12-15 10:16, Bernd Kuhls wrote:
>>> To reproduce the build error I had to install libpcap0.8-dev on my host
>>> system, then wireshark configure picks up
>>>
>>> checking for pcap-config... /usr/bin/pcap-config
>>
>>  To fundamentally avoid this type of issue (we have a bunch of fixes like this),
>> I think we should add an additional directory that is put in the _beginning_ of
>> the path in TARGET_MAKE_ENV. This directory could then be populated through the
>> _CONFIG_SCRIPTS mechanism.
>>
>>  What do the others think?
> 
> I'v estarted having a look at your suggestion. The basic idea is
> relatively trivial to do, and I now have a FOO_CONFIG_DIR location
> where I put those scripts.
> 
> However, I'm not facing a wall:

 I guess you _are_ facing a wall :-)

> we use the same PATH for both the target
> and the host packages, set in BR_PATH. But of course, we do not want the
> host variants to find those foo-config scripts, since they are for the
> target; we really want host packages to find the host variants, whether
> the ones we install as part of our host packages, or the ones from the
> system.
> 
> So, we'd need to split the PATH for host and target variants.
> 
> I wonder if that would be acceptable.

 They used to be, but since they were identical, Samuel factored them away in
b989976.

> 
>>  It will be a bit of work to revert all these fixes again :-)
> 
> Indeed. I've already tried to hunt down all our "fixes" for this, and I
> have identified two cases:
> 
>   - packages already accept a FOO_CONFIG environement variable; for
>     those we just need to unset it;
> 
>   - we patch the package to replace a hard-coded cal to foo-config with
>     a construct like ${FOO_CONFIG:-foo-config}, for those, we need to
>     alse unpatch the package.
> 
> My grep-fuu must still be asleep today, since I could only identify wine
> in the second category, although I'm pretty sure we have at least a few
> other packages that we do patch for that.

git grep \\-config -- \*.patch

 Lot's of false positives though.


> The packages in the first category are reltively rare: only about 50 of
> them I could identify, so it should be pretty easy to fix.

 I was more concerned with the fixes like the one that was added by this patch:
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 534131b..2b06699 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -24,6 +24,7 @@ WIRESHARK_CONF_OPTS = \
 	--enable-static=no \
 	--with-libsmi=no \
 	--with-lua=no \
+	--with-pcap=$(STAGING_DIR)/usr \
 	--includedir=$(STAGING_DIR)/usr/include

 Another grep which turns up lots of false positives:
git grep '\--with-.*=\$(STAGING_DIR)'


 Regards,
 Arnout


> 
> I'll work on this a bit mor elater today...
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
