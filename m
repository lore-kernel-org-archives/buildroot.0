From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 13 Aug 2016 19:48:31 +0200
Subject: [Buildroot] [PATCH] package/ustr: don't run ldconfig (and
 certainly not concurrently)
In-Reply-To: <20160813152753.GB5734@free.fr>
References: <1471096801-9875-1-git-send-email-yann.morin.1998@free.fr>
 <28ed24c9-fb7d-e0ce-653d-993c01d1d341@mind.be>
 <20160813152753.GB5734@free.fr>
Message-ID: <e13e20a2-6902-74f7-ea2a-95c5cdb266fe@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13-08-16 17:27, Yann E. MORIN wrote:
> Arnout, All,
> 
> On 2016-08-13 17:00 +0200, Arnout Vandecappelle spake thusly:
>>  [Back from a month in Benin with almost no Internet access - yey!]
>>
>> On 13-08-16 16:00, Yann E. MORIN wrote:
[snip]
>>> +diff -durN ustr-1.0.4.orig/Makefile.in ustr-1.0.4/Makefile.in
>>> +--- ustr-1.0.4.orig/Makefile.in	2016-08-13 15:54:40.220043291 +0200
>>> ++++ ustr-1.0.4/Makefile.in	2016-08-13 15:55:25.600641886 +0200
>>> +@@ -427,11 +427,11 @@
>>> + 		install -m 644 -t $(DESTDIR)$(libdir) $(OPT_LIB_STATIC)
>>> + 		install -m 755 -t $(DESTDIR)$(libdir) $(OPT_LIB_SHARED)
>>> + 		-rm -f $(DESTDIR)$(libdir)/$(OPT_LIB_SHARED_NAME)
>>> +-		ln -s $(OPT_LIB_SHARED) $(DESTDIR)$(libdir)/$(OPT_LIB_SHARED_NAME)
>>> ++		ln -fs $(OPT_LIB_SHARED) $(DESTDIR)$(libdir)/$(OPT_LIB_SHARED_NAME)
>>
>>  This is fairly useless. 'ln -f' just does stat - unlink - symlink, so almost
>> the same as 'rm -f; ln -s'. There is a timing difference, so it makes the race
>> condition somewhat more difficult to hit, but it still exists. There is no
>> race-free way to do parallel symlinks.
> 
> But there should be no race now, since we no longer do ldconfig.
> 
> Yes, the rm -f may be supperflouous, unless the symlink was read-only [0],
> in which case ln -f would not remove it.
> 
> [0] this is technically possible: fchmodat() has a AT_SYMLINK_NOFOLLOW
>     flag, implying that it should be possible to do change the mode of
>     a symlink without dereferencing it, but it is not yet implemented
>     under Linux (others systems may be able to do so).
> 
> Of course, this is all hypotetical so far. ;-)
> 
> But the reasons I wrote it that way:
>   - that's the least invasive change,
>   - that's what Thomas suggested back in May.

 You seem to have missed my point: adding the -f doesn't solve the race
condition, it just slightly reduces the time window in which the race can hit.
So this patch is completely pointless.

 If you remove the rm as well, then it could serve some purpose, but only to
simplify the code, not to fix parallel build issues.

 Since the LDCONFIG=/bin/true is sufficient for Buildroot, I propose to send
your patches to Debian upstream and just keep the LDCONFIG part for Buildroot.
We really don't want to add unneeded patches to a dead package, do we?

 Regards,
 Arnout

[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
