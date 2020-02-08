From: Vadim Kochan <vadim4j@gmail.com>
Date: Sat, 8 Feb 2020 23:16:53 +0200
Subject: [Buildroot] [PATCH 1/1] utils/show-progress: add tool to show
 build progress at runtime
In-Reply-To: <989f7e1a-4aff-6ba6-d909-5662511f5876@mind.be>
References: <20190807203502.27269-1-vadim4j@gmail.com>
 <989f7e1a-4aff-6ba6-d909-5662511f5876@mind.be>
Message-ID: <CAMw6YJ+fWm_JYYu5sfy3c6PgsywL+LPz_dEEPcOKzEPop7CTTg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Wed, Feb 5, 2020 at 5:48 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>  Hi Vadim,
>
>  We finally got to this patch :-)
>
> On 07/08/2019 22:35, Vadim Kochan wrote:
> > This might be useful to watch the amount of built and selected
> > packages and some progress about it. So added python script which
> > prints progress and build stats. The sample of output is:
> >
> > Press Ctrl-C to exit ...
> >
> > Building: output/qemu_x86_64
> >  ##################################------------------------------ [ 42.42% 14/33]
> >
> > Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
>
>  I tried it twice and it failed both times....
>
>
>  First I tried with an in-tree build, and that failed with:
>
> Traceback (most recent call last):
>   File "/home/arnout/src/buildroot/utils/show-progress", line 104, in <module>
>     main()
>   File "/home/arnout/src/buildroot/utils/show-progress", line 83, in main
>     pkgs = get_pkgs_list(os.path.realpath(build_dir))
>   File "/home/arnout/src/buildroot/utils/show-progress", line 46, in get_pkgs_list
>     pkg_list = json.loads(p.communicate()[0])
>   File "/usr/lib64/python3.7/json/__init__.py", line 348, in loads
>     return _default_decoder.decode(s)
>   File "/usr/lib64/python3.7/json/decoder.py", line 337, in decode
>     obj, end = self.raw_decode(s, idx=_w(s, 0).end())
>   File "/usr/lib64/python3.7/json/decoder.py", line 355, in raw_decode
>     raise JSONDecodeError("Expecting value", s, err.value) from None
> json.decoder.JSONDecodeError: Expecting value: line 1 column 1 (char 0)
>
> (for in-tree build, the '-C build_dir' shouldn't be there; so I'd make the
> build_dir optional and assume in-tree build if it's not provided.)
>
>
>  Second, with out-of-tree build, it failed with:
>
> Traceback (most recent call last):
>   File "/home/arnout/src/buildroot/utils/show-progress", line 104, in <module>
>     main()
>   File "/home/arnout/src/buildroot/utils/show-progress", line 83, in main
>     pkgs = get_pkgs_list(os.path.realpath(build_dir))
>   File "/home/arnout/src/buildroot/utils/show-progress", line 46, in get_pkgs_list
>     pkg_list = json.loads(p.communicate()[0])
>   File "/usr/lib64/python3.7/json/__init__.py", line 348, in loads
>     return _default_decoder.decode(s)
>   File "/usr/lib64/python3.7/json/decoder.py", line 337, in decode
>     obj, end = self.raw_decode(s, idx=_w(s, 0).end())
>   File "/usr/lib64/python3.7/json/decoder.py", line 355, in raw_decode
>     raise JSONDecodeError("Expecting value", s, err.value) from None
> json.decoder.JSONDecodeError: Expecting value: line 1 column 51421 (char 51420)
>
>  That's probably a python3 issue. In fact, the script should explicitly call
> python3. We don't want deprecated stuff.
>
>
>  We also discussed a bit about whether this should be integrated in brmake, but
> it seems quite difficult so let's just get a working version in first :-)
>
>  Regards,
>  Arnout
>

Hm, I tried with Python 3.8 on latest Buildroot master, I checked
qemu_x86_defconfig and it works
for me. Can you share the defconfig (in case if there some special
JSON output value which is not
parsable) ?

Thanks,
Vadim Kochan
