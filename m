From: =?UTF-8?B?U3RlZmFuIEZyw7ZiZXJn?= <stefan.froberg@petroprogram.com>
Date: Fri, 18 Jan 2013 14:58:13 +0200
Subject: [Buildroot] [PATCH v2] pkg-infra: add <pkg>_CONFIG_FIXUP to fix
 *-config files
In-Reply-To: <50F7B710.2000703@mind.be>
References: <1357847559-31530-1-git-send-email-stefan.froberg@petroprogram.com>
 <1357847559-31530-2-git-send-email-stefan.froberg@petroprogram.com>
 <50F08535.509@mind.be> <50F0BE8A.8000502@petroprogram.com>
 <50F7B710.2000703@mind.be>
Message-ID: <50F946E5.20903@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout!

17.1.2013 10:32, Arnout Vandecappelle kirjoitti:
> On 12/01/13 02:38, Stefan Fr?berg wrote:
>> 11.1.2013 23:33, Arnout Vandecappelle kirjoitti:
>>> On 10/01/13 20:52, Stefan Fr?berg wrote:
>>>> This patch will add<pkg>_CONFIG_FIXUP variable to buildroot infra.
>>>> It's purpose is to inform buildroot that the package in question
>>>> contains some $(STAGING_DIR)/usr/bin/*-config files and that we
>>>> want to automatically fix prefixes of such files.
> [snip]
>> I have a question that has been nagging in my head two days now:
>>
>> Let's suppose that command
>>
>> $(STAGING_DIR)/usr/bin/somepkg-config  --prefix gives the correct prefix
>> $(STAGING_DIR)/usr  which is ok
>>
>> And $(STAGING_DIR)/usr/bin/somepkg-config --cflags gives empty (which is
>> also fine)
>>
>> But $(STAGING_DIR)/usr/bin/somepkg-config --libs gives -L/usr/lib
>>
>> Isn't this horribly wrong ? I think it should give 
>> -L$(STAGING_DIR)/usr/lib
>
>  --libs should not give -L/usr/lib, that's for sure!
>
>  I had a quick look at some *-config scripts, and I couldn't find any
> that does this. Maybe we should check all of them (51 in my allpkgbuild).
>
>  A generic solution could be the following: put a script in
> $(HOST_DIR)/usr/bin (or some other directory) that hands the known
> arguments to pkg-config and redirects the rest back to the original
> *-config script. This makes patching of the *-config script
> unnecessary in most cases.
>

Sounds good but what about that <pkg>_CONFIG_FIXUP variable that was
started from Gustavo suggestion (originally from divine-config: fixup
thread) ?

http://lists.busybox.net/pipermail/buildroot/2013-January/064656.html

Was it now totally waste of time ?  :-(

>  Something to discuss (again) at the BR developer days?
>
>
>> I noticed that some *-config files have just prefix (and maybe
>> exec_prefix) but not any includedir or libdir defined inside them
>> and just give -I/usr/include for --cflags and -L/usr/lib for --libs
>
>  Even worse! Which one does that?
>

Well, at least:

giblib-config    --cflags    gives -I/usr/include
neon-config    --cflags    gives -I/usr/include

But Im using older 2012.08 buildroot so maybe they are fixed now?

>> Im beginning to suspect now that this is the very reason that my
>> wireshark compilation borked, like you said Arnout, with that -L/usr/lib
>> being added somehow to the final linking of wireshark binary  ....
>
>  That could very well be...
>
>> This or then that *.la file problem you mentioned.
>
>  Yes, but the *.la file only puts it in there if it was instructed to
> search for that library in /usr/lib. So the path must have been given
> to it somewhere, either in config.status or hard-coded in some
> Makefile.in.
>
>  Regards,
>  Arnout
>

Ok. Ill try to dig deeper from those files where wireshark fetches that
damn -L/usr/lib

Thanks!

Stefan
