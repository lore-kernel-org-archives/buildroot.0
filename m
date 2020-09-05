From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 5 Sep 2020 12:19:24 +0200
Subject: [Buildroot] [PATCH/next 1/2] package/libcap: drop host-gperf
 dependency
In-Reply-To: <20200903224714.45ad0042@windsurf.home>
References: <20200830100058.4180798-1-fontaine.fabrice@gmail.com>
 <20200903224714.45ad0042@windsurf.home>
Message-ID: <CAPi7W81qUCBKHMqXky4Q_8UXFUFBHv9_EeaLLTEd9cDAqR=HGg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Le jeu. 3 sept. 2020 ? 22:47, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> Hello Fabrice,
>
> On Sun, 30 Aug 2020 12:00:57 +0200
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > host-gperf dependency was added in commit
> > 5d8926add5da1b0bdfb90a41f4d7f857864c5524 without any explanation in the
> > commit message but gperf can be disabled through BUILD_GPERF since
> > https://git.kernel.org/pub/scm/linux/kernel/git/morgan/libcap.git/commit/?id=3c22870c762f7925b5ff143d76f9affbade275ba
> >
> > So use this variable and drop this unneeded dependency
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>
> Thanks for looking into this. I agree that BUILD_GPERF=no will avoid
> the host-gperf dependency, however I'm a bit confused how this works in
> libcap and whether it has any drawback.
>
> When gperf is detected, it will be used to generate some C code that
> contains a hash function:
>
> ifeq ($(BUILD_GPERF),yes)
> USE_GPERF_OUTPUT = $(GPERF_OUTPUT)
> INCLUDE_GPERF_OUTPUT = -DINCLUDE_GPERF_OUTPUT='"$(GPERF_OUTPUT)"'
> endif
>
> $(GPERF_OUTPUT): cap_names.list.h
>         perl -e 'print "struct __cap_token_s { const char *name; int index; };\n%{\nconst struct __cap_token_s *__cap_lookup_name(const char *, size_t);\n%}\n%%\n"; while ($$l = <>) { $$l =~ s/[\{\"]//g; $$l =~ s/\}.*// ; print $$l; }' < $< | gperf --ignore-case --language=ANSI-C --readonly --null-strings --global-table --hash-function-name=__cap_hash_name --lookup-function-name="__cap_lookup_name" -c -t -m20 $(INDENT) > $@
>         sed -e 's/unsigned int len/size_t len/' -i $@
>
> cap_text.o: cap_text.c $(USE_GPERF_OUTPUT) $(INCLS)
>         $(CC) $(CFLAGS) $(IPATH) $(INCLUDE_GPERF_OUTPUT) -c $< -o $@
>
> Then in cap_text.c, this gets used like this:
>
> #ifdef INCLUDE_GPERF_OUTPUT
> /* we need to include it after #define _GNU_SOURCE is set */
> #include INCLUDE_GPERF_OUTPUT
> #endif
>
> So the gperf-generated source file, if it exists is included. But I
> don't see any conditional code that makes use of it when available.
gperf code has been added with
https://git.kernel.org/pub/scm/linux/kernel/git/morgan/libcap.git/commit/?id=e57378c88b6144ff9c06777ff0e0c9d722eeefd3

From my understanding, gperf code is used in libcap/cap_text.c by the
lookupname function:

#ifdef GPERF_DOWNCASE
 const struct __cap_token_s *token_info;
 int c;
 unsigned len;

 for (len=0; (c = str.constp[len]); ++len) {
 if (!(isalpha(c) || (c == '_'))) {
 break;
 }
 }
 token_info = __cap_lookup_name(str.constp, len);
 if (token_info != NULL) {
 *strp = str.constp + len;
 return token_info->index;
 }
#else /* ie., ndef GPERF_DOWNCASE */

lookupname is used by cap_from_name which is a part of the public API
and is also used by capsh program.
>
> Am I missing something? I wanted to understand the impact of not having
> gperf. Perhaps not having a hash function makes libcap significantly
> slower ?
Yes, you're right, not having gperf will have an unknown (but probably
small?) performance impact.
I didn't take time to measure it on an embedded target but we should
probably keep building host-gperf for the target (and probably also
for the host as host-gperf is not a "huge" dependency).
>
> Initially, I was expected libcap to have a pre-generated version of the
> file, and having gperf available would only allow to re-generate the
> file, but that doesn't seem to be what's happening.
>
> Do you understand a bit better what is going on here ?
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
Best Regards,

Fabrice
