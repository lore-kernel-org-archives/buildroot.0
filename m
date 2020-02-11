From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Tue, 11 Feb 2020 15:06:51 +0100
Subject: [Buildroot] [PATCH v2 1/2] support/scripts/pkg-stats: add
 support for CVE reporting
In-Reply-To: <7e98b20a-a1e3-e5fd-8506-0e6ae65de819@railnova.eu>
References: <20200208215752.13628-1-titouan.christophe@railnova.eu>
 <20200208215752.13628-2-titouan.christophe@railnova.eu>
 <CAAXf6LUu-2M24MvoqZnTgE0CYe0LK+0C4ov84Y2JejrbcEnoWw@mail.gmail.com>
 <7e98b20a-a1e3-e5fd-8506-0e6ae65de819@railnova.eu>
Message-ID: <CAAXf6LWTJGe96aa3CCVtw6eCVLNO5Gp-=qLz1yiU4uzgNAg5FQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Titouan,

El mar., 11 feb. 2020 a las 12:15, Titouan Christophe
(<titouan.christophe@railnova.eu>) escribi?:
[..]
>
> > @@ -227,7 +231,13 @@ class CVE:
> >           """
> >           for year in range(NVD_START_YEAR, datetime.datetime.now().year + 1):
> >               filename = CVE.download_nvd_year(nvd_dir, year)
> > -            content = json.load(gzip.GzipFile(filename))
> > +            try:
> > +                content = json.load(gzip.GzipFile(filename))
> > +            except (zlib.error, IOError) as e:
> > +                print('ERROR: problem reading %s, please remove the
> > file and rerun this script.' % filename)
> > +                print(e)
> > +                sys.exit(1)
> > +
>
> I don't find it pythonic to catch the exception then exit. Unless
> there's a really good reason to do so, I'd prefer to let the exception
> bubble up, as it helps diagnosing the issue. Maybe something like:
>
> try:
>      content = json.load(gzip.GzipFile(filename))
> except:
>      # Display an informative message about the problematic file
>      print("ERROR: cannot read %s. Please remove the file then rerun
> this script" % filename)
>      # Then bubble up the exception
>      raise

Ok for me, thanks.

>
> (Also, exit() is included in the global namespace, so no need to import
> the sys module for that)

The documentation for exit() says:
https://docs.python.org/2/library/constants.html#exit

"They are useful for the interactive interpreter shell and should not
be used in programs."

This is also described here:
https://stackoverflow.com/questions/19747371/python-exit-commands-why-so-many-and-when-should-each-be-used

Best regards,
Thomas
