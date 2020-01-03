From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Fri, 3 Jan 2020 17:32:42 +0100
Subject: [Buildroot] [PATCH 05/11] support/scripts/pkg-stats: parse and
 set developers info
In-Reply-To: <20200103162625.093ff7b2@windsurf>
References: <20200103151849.10956-1-heiko.thiery@gmail.com>
 <20200103151849.10956-6-heiko.thiery@gmail.com>
 <20200103162625.093ff7b2@windsurf>
Message-ID: <CAEyMn7aPCiLX-RB8vYm_-OnhrjXXrxJg+ufYgPUx5cRcjSW0tw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Fr., 3. Jan. 2020 um 16:26 Uhr schrieb Thomas Petazzoni
<thomas.petazzoni@bootlin.com>:
>
> Hello,
>
> On Fri,  3 Jan 2020 16:18:42 +0100
> Heiko Thiery <heiko.thiery@gmail.com> wrote:
>
> > +class Developer:
> > +    def __init__(self, name, files):
> > +        self.name = name
> > +        self.files = files
> > +
> > +def parse_developers(basepath=None):
> > +    """Parse the DEVELOPERS file and return a list of Developer objects."""
> > +    developers = []
> > +    linen = 0
> > +    if basepath is None:
> > +        basepath = os.getcwd()
> > +    with open(os.path.join(basepath, "DEVELOPERS"), "r") as f:
> > +        files = []
> > +        name = None
> > +        for line in f:
> > +            line = line.strip()
> > +            if line.startswith("#"):
> > +                continue
> > +            elif line.startswith("N:"):
> > +                if name is not None or len(files) != 0:
> > +                    print("Syntax error in DEVELOPERS file, line %d" % linen)
> > +                name = line[2:].strip()
> > +            elif line.startswith("F:"):
> > +                fname = line[2:].strip()
> > +                #dev_files = glob.glob(os.path.join(basepath, fname))
> > +                dev_files = glob.glob(fname)
> > +                if len(dev_files) == 0:
> > +                    print("WARNING: '%s' doesn't match any file" % fname)
> > +                files += dev_files
> > +            elif line == "":
> > +                if not name:
> > +                    continue
> > +                developers.append(Developer(name, files))
> > +                files = []
> > +                name = None
> > +            else:
> > +                print("Syntax error in DEVELOPERS file, line %d: '%s'" % (linen, line))
> > +
> > +                return None
> > +            linen += 1
> > +    # handle last developer
> > +    if name is not None:
> > +        developers.append(Developer(name, files))
> > +    return developers
>
> You have duplicated this function from utils/getdeveloperlib.py, which
> is intended to be used as a Python module. Why don't we try to use it,
> instead ?

I also thought about that ... should we then move the pkg-stats script
to the utils folder?

> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
