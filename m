From: yann.morin at orange.com <yann.morin@orange.com>
Date: Tue, 11 Feb 2020 12:38:42 +0100
Subject: [Buildroot] [PATCH v2 1/2] support/scripts/pkg-stats: add
 support for CVE reporting
In-Reply-To: <7e98b20a-a1e3-e5fd-8506-0e6ae65de819@railnova.eu>
References: <20200208215752.13628-1-titouan.christophe@railnova.eu>
 <20200208215752.13628-2-titouan.christophe@railnova.eu>
 <CAAXf6LUu-2M24MvoqZnTgE0CYe0LK+0C4ov84Y2JejrbcEnoWw@mail.gmail.com>
 <7e98b20a-a1e3-e5fd-8506-0e6ae65de819@railnova.eu>
Message-ID: <25829_1581421125_5E429245_25829_382_1_20200211113842.GB2906@r-lnx-nyma7486-2>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Titouan, All,

On 2020-02-11 12:15 +0100, Titouan Christophe spake thusly:
> On 2/11/20 11:02 AM, Thomas De Schampheleire wrote:
> >El s?b., 8 feb. 2020 a las 22:58, Titouan Christophe
> >(<titouan.christophe@railnova.eu>) escribi?:
> >>From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> >>This commit extends the pkg-stats script to grab information about the
> >>CVEs affecting the Buildroot packages.
[--SNIP--]
> >@@ -227,7 +231,13 @@ class CVE:
> >          """
> >          for year in range(NVD_START_YEAR, datetime.datetime.now().year + 1):
> >              filename = CVE.download_nvd_year(nvd_dir, year)
> >-            content = json.load(gzip.GzipFile(filename))
> >+            try:
> >+                content = json.load(gzip.GzipFile(filename))
> >+            except (zlib.error, IOError) as e:
> >+                print('ERROR: problem reading %s, please remove the file and rerun this script.' % filename)
> >+                print(e)
> >+                sys.exit(1)
> >+
> 
> I don't find it pythonic to catch the exception then exit. Unless there's a
> really good reason to do so, I'd prefer to let the exception bubble up, as
> it helps diagnosing the issue.

The exception is print()ed, at least (not sure if that also prints the
barcktrace, though?).

[--SNIP--]
> >@@ -892,6 +902,8 @@ def __main__():
> >      check_package_latest_version(packages)
> >      if args.nvd_path:
> >          print("Checking packages CVEs")
> >+        if not os.path.exists(args.nvd_path):
> >+            os.makedirs(args.nvd_path)
> I thought that not creating the directory was a design choice, but this
> indeed makes much more sense.

In python3, makedirs() can take the option exist_ok=False to tell it to
not fail on an already existing directory, so that would avoid this
test-and-create racy code.

Aha, this is a python2 script. Damned... ;-p

Regards,
Yann E. MORIN.

> >          check_package_cves(args.nvd_path, {p.name: p for p in packages})
> >      print("Calculate stats")
> >      stats = calculate_stats(packages)
> >
> >
> >Best regards,
> >Thomas
> >
> 
> Regards,
> 
> Titouan
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
                                        ____________
.-----------------.--------------------:       _    :------------------.
|  Yann E. MORIN  | Real-Time Embedded |    __/ )   | /"\ ASCII RIBBON |
| +33 534.541.179 | Software  Designer |  _/ - /'   | \ / CAMPAIGN     |
| +33 638.411.245 '--------------------: (_    `--, |  X  AGAINST      |
|      yann.morin (at) orange.com      |_="    ,--' | / \ HTML MAIL    |
'--------------------------------------:______/_____:------------------'


_________________________________________________________________________________________________________________________

Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.
