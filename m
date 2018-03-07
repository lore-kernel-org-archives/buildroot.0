From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 7 Mar 2018 23:35:19 +0100
Subject: [Buildroot] [PATCH next v2 1/5] support/scripts/pkg-stats-new:
 rewrite in Python
In-Reply-To: <5a8e23dda8705_24263ff17ca48f783320@ultri3.mail>
References: <20180221221342.15683-2-thomas.petazzoni@bootlin.com>
 <5a8e23dda8705_24263ff17ca48f783320@ultri3.mail>
Message-ID: <20180307233519.6eeda226@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 21 Feb 2018 22:58:53 -0300, Ricardo Martincoski wrote:

> This method is missing patches in subdirs for binutils, gdb, ...
> 
>     for pkg in packages:
>         pkg.patch_count = 0
>         for subdir, _, _ in os.walk(pkgdir):
>             pkg.patch_count += len(fnmatch.filter(os.listdir(subdir), '*.patch'))

ACK, already fixed for v3.

> > +def get_check_package_warnings(pkgdir):
> > +    cmd = ["./utils/check-package"]
> > +    for root, dirs, files in os.walk(pkgdir):
> > +        for f in files:
> > +            if f.endswith(".mk") or f.endswith(".hash") or f == "Config.in" or f == "Config.in.host":
> > +                cmd.append(f)  
> 
> Here you need:
>                 cmd.append(os.path.join(root, f))
> otherwise the whole column is filled with zeros.

Indeed. Fixed for v3.

> 
> > +    o = subprocess.check_output(cmd, stderr=subprocess.STDOUT)  
> 
> When above line is fixed, this command can return non-zero code that leads to
> exception CalledProcessError. There are a few ways to solve it:
> 
> 1)
>     o = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE).communicate()[1]
> 2)
>     try:
>         ...
>     except ...
> 3) change check-package, adding an option to always return code zero.
> 
> IMO, option 1 is the better one.

Agreed, fixed for v3 as well.

Thanks for the review!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
