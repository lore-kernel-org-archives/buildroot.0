From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 17 Feb 2014 18:46:48 +0100
Subject: [Buildroot] Open bug analysis
In-Reply-To: <CAAXf6LVJwg4Xcjg1rMZvfgC8xi-9TJrV7faUknff630duLG_AQ@mail.gmail.com>
References: <CAAXf6LUmkkW8RxfC8RjYTYRnFDJ+TbNOiKM+LyMBDHJu37ORZA@mail.gmail.com>
 <20140213195254.0b17b5bf@skate>
 <CAAXf6LVJwg4Xcjg1rMZvfgC8xi-9TJrV7faUknff630duLG_AQ@mail.gmail.com>
Message-ID: <53024B08.1040709@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14/02/14 21:39, Thomas De Schampheleire wrote:
> Hi Thomas,
> 
> Thanks for your feedback...
> 
> On Thu, Feb 13, 2014 at 7:52 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> > Dear Thomas De Schampheleire,
>> >
>> > On Thu, 13 Feb 2014 16:30:37 +0100, Thomas De Schampheleire wrote:
>> >
>>> >> Doing a Buildroot build from /usr doesn't work
>>> >> https://bugs.busybox.net/show_bug.cgi?id=5750
>>> >> ThomasP, you are assigned to this bug. Have you done an analysis about
>>> >> this in the past? What are the reasons for these problems?
>> >
>> > The main problem I had identified was our logic to fixup the .la files.
>> > To fix it, I had written:
>> >
>> > -               $$(SED) "s:\(['= ]\)/usr:\\1$(STAGING_DIR)/usr:g" $$$$i; \
>> > +               $$(SED) "\:['= ]$(STAGING_DIR)/usr:!s:\(['= ]\)/usr:\\1$(STAGING_DIR)/usr:g" $$$$i; \
>> >
>> > but I believe it still wasn't working properly, because the staging
>> > directory was being re-prefixed everytime this was executed on all .la
>> > files. But I may not necessarily remember all the details.
> I am trying to reproduce and fix this.
> As mentioned on IRC, I'm currently using a slightly modified version
> of the above .la fixing:
> 
> -               $$(SED) "s:\(['= ]\)/usr:\\1$(STAGING_DIR)/usr:g" $$$$i; \
> +               $$(SED) "s:\(['=
> ]\)/usr/lib:\\1$(STAGING_DIR)/usr/lib:g" $$$$i; \
> +               $$(SED) "s:\(['=
> ]\)/usr/local/lib:\\1$(STAGING_DIR)/usr/local/lib:g" $$$$i; \
> 
> I.e. instead of searching for /usr/something, only search for /usr/lib
> as this is where all .la files are put.
> I actually don't think we need the /usr/local/lib line.

 Just brainstorming here, but I think a more complete solution could be
something like:

$$(SED) -e "s:\(['= ]\)$(STAGING_DIR):\\1 at STAGING_DIR@:g" \
        -e "s:\(['= ]\)/usr:\\1$(STAGING_DIR)/usr:g" \
        -e "s:@STAGING_DIR@:$(STAGING_DIR):g" \
        $$$$i;



 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
