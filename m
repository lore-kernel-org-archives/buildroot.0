From: Nasser <afshin.nasser@gmail.com>
Date: Sat, 27 Oct 2018 02:35:47 +0330
Subject: [Buildroot] Antwort: Re: Antwort: Re: [PATCH v3]
 merge_config.sh: merge also buildroot config files
In-Reply-To: <OF26A838D6.35610758-ONC1258332.00211513-C1258332.0021531B@local-dmz.de>
References: <20181025011343.29512-1-afshin.nasser@gmail.com>
 <20181025022031.14043-1-afshin.nasser@gmail.com>
 <20181025074309.GB18528@dell5510>
 <OF54A89E59.8DBA5497-ONC1258331.0034C458-C1258331.00357034@local-dmz.de>
 <20181025214311.GB31691@dell5510>
 <OF26A838D6.35610758-ONC1258332.00211513-C1258332.0021531B@local-dmz.de>
Message-ID: <20181026230546.GA18350@smart-ThinkPad-T410>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Marcel, Petr,
On Fri, Oct 26, 2018 at 08:03:59AM +0200, Marcel Patzlaff wrote:
> Hi Petr,
> 
> > Looking in the code uclibc-ng uses several prefixes: CONFIG_, TARGET_, 
> UCLIBC_
> > and sometimes even configs without prefix: VERSION, WARNINGS, 
> > EXTRA_WARNINGS [1].
> > 
> > But their SED_CONFIG_EXP uses also CONFIG_.
> 
> As you said, they use several prefixes. IMHO, it does not make sense to
> filter out configuration items based on a prefix.
> And BTW, uclibc does not use it's own merge_config.sh anywhere and I
> assume that it is also not used elsewhere.
Yes uclibc does not use it's own merge_config.sh anywhere.
> 
> I would suggest to just remove the prefix restrictions in buildroot's
> merge_config.sh unless someone can tell why they are important to be
> there.
The problem is that some of our defconfig files include comment lines
(e.g raspberrypi_defconfig, cubieboard2_defconfig,
qemu_arm_versatile_defconfig, ...). If we completely omit the
${CONFIG_PREFIX} we will add first word of comments to $CFG_LIST and
therefor will produce some false warning reports for comment lines (if
the fist word is just repeated anywhere throughout the fragments which
is none sense)

If we consider the controversial part of the script which is either:
sed -n 's/^\(# \)\{0,1\}\(CONFIG_[a-zA-Z0-9_]*\)[= ].*/\2/p' \
defconfig_file_name

for kernel style config files or

sed -n 's/^\(# \)\{0,1\}\(BR2_[a-zA-Z0-9_]*\)[= ].*/\2/p' \
defconfig_file_name

for buildroot style config files or

sed -n 's/^\(# \)\{0,1\}\([a-zA-Z0-9_]*\)[= ].*/\2/p' \
defconfig_file_name

as a general command then for different buildroot/kernel defconfig
files, the last one will extract comments as well which IMHO is not what we
want.
> 
> Kind regards,
> Marcel
> 
> PS: Sorry for the second reply. My mailclient dropped the list...
> 
> -- 
> 
> Gesch?ftsf?hrung: Susanne Kunschert, Thomas Pilz
> Pilz GmbH & Co. KG, Sitz: Ostfildern, HRA 210 893, Amtsgericht Stuttgart
> Kompl. Ges. Peter Pilz GmbH, Sitz: Ostfildern, HRB 210 612, Amtsgericht Stuttgart
> Umsatzsteuer: ID-Nr. DE 145 355 773, WEEE-Reg.-Nr. DE 71636849
> This email is intended solely for the use of the named address(es). Any unauthorised disclosure, copying or distribution of these confidential information contained therein, or the taking of any action based on it, is prohibited. The sender disclaims any liability for the integrity of this email. Legally binding declarations must be in written form.
> Umweltschutz liegt uns am Herzen! - Bitte denken Sie an unsere Umwelt, bevor Sie diese E-Mail drucken.
> We do care about the environment! - Please consider the environment before printing this e-mail.
Kind regards,
Nasser
