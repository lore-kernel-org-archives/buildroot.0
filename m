From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 13 Sep 2019 22:10:07 +0200
Subject: [Buildroot] [PATCH 1/1] package/opencv3: python support needs
 .py modules
In-Reply-To: <2ab3c932-a8d0-b682-18d1-552b5ccb81d6@mind.be>
References: <20190905184403.19368-1-fontaine.fabrice@gmail.com>
 <2ab3c932-a8d0-b682-18d1-552b5ccb81d6@mind.be>
Message-ID: <20190913221007.74731262@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 8 Sep 2019 17:48:46 +0200
Arnout Vandecappelle <arnout@mind.be> wrote:

> On 05/09/2019 20:44, Fabrice Fontaine wrote:
> > Fixes:
> >  - https://bugs.buildroot.org/show_bug.cgi?id=12171  
> 
>  To make sure this thread stays readable, I'll repeat the relevant part of the
> bug report, which should have been part of the commit message:
> 
> When importing cv2 in python 3.7, the program stops with:
> 
>   File "usr/lib/python3.7/site-packages/cv2/__init__.py", line 89, in <module>
>   File "usr/lib/python3.7/site-packages/cv2/__init__.py", line 58, in bootstrap
>   File "usr/lib/python3.7/site-packages/cv2/__init__.py", line 56, in
> load_first_config
> ImportError: OpenCV loader: missing configuration file: ['config.py']. Check
> OpenCV installation.
> 
> Since buildroot removed all *.py, leaving the corresponding *.pyc, the above
> config.py file is not in target.

It is a bit weird/funky for OpenCV to require a .py file just for this.
It contains a single variable:

BINARIES_PATHS = [
    @CMAKE_PYTHON_BINARIES_PATH@
] + BINARIES_PATHS

And then the code looks like this:

    def load_first_config(fnames, required=True):
        for fname in fnames:
            fpath = os.path.join(LOADER_DIR, fname)
            if not os.path.exists(fpath):
                if DEBUG: print('OpenCV loader: config not found, skip: {}'.format(fpath))
                continue
            if DEBUG: print('OpenCV loader: loading config: {}'.format(fpath))
            exec_file_wrapper(fpath, g_vars, l_vars)
            return True
        if required:
            raise ImportError('OpenCV loader: missing configuration file: {}. Check OpenCV installation.'.format(fnames))

    load_first_config(['config.py'], True)
    load_first_config([
        'config-{}.{}.py'.format(sys.version_info[0], sys.version_info[1]),
        'config-{}.py'.format(sys.version_info[0])
    ], True)

So all it does is override the BINARIES_PATH array with some additional
value. I'm sure we can replace this with reading a simple text file
that does the exact same thing without requiring to compile/exec a .py
file.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
