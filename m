From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 12 Sep 2020 00:06:02 +0200
Subject: [Buildroot] [PATCH buildroot-test] scripts/autobuild-run:
 create host-distro file
In-Reply-To: <20200911125527.28267-1-heiko.thiery@gmail.com>
References: <20200911125527.28267-1-heiko.thiery@gmail.com>
Message-ID: <20200911220602.GD10548@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Heiko, All,

On 2020-09-11 14:55 +0200, Heiko Thiery spake thusly:
> Sometime autobuilder failures occure only on a specific distribution. To

*occur

> ease the research for the maintainer/developers add a file with that
> information to the result archive.
> 
> The distribution information comes from '/etc/os-release' and the
> PRETTY_NAME value is used from This file. This seems to be present on

*this (lower-case)

I think it would be easier to just copy the file.

Also, /etc/os-release may not exist, in which case we should look to the
preferred locaiton, /usr/lib/os-release, something along the lines of:

    def get_os_release_path():
        for p in ['/etc/os-release', '/usr/lib/os-release']:
            if os.path.exists(p):
                return p
        return None

    def save_host_distro_info():
        [blurb]
        host_distro = os.path.join(self.resultdir, "host-distro")
        os_release = get_os_release_path()
        if os_release is None:
            with open(host_distro, "w") as f:
                f.write('Unknown')
        else:
            shutil.copyfile(so_release, host_distro)

Otherwise, if you have a good argument against the copy and to keep only
PRETTY_NAME, see below...

> the most common distros:
> 
> Debian: https://manpages.debian.org/testing/manpages-de/os-release.5.de.html

Could you find an english version, please? My german (the very little I
ever had) is a bit rusted... ;-]

I guess we would use that one, instead:
    https://manpages.debian.org/buster/systemd/os-release.5.en.html

> Ubuntu: http://manpages.ubuntu.com/manpages/bionic/man5/os-release.5.html
> Red Red: https://www.freedesktop.org/software/systemd/man/os-release.html
> Open-Suse: https://en.opensuse.org/SDB:Find_openSUSE_version
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
>  scripts/autobuild-run | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/scripts/autobuild-run b/scripts/autobuild-run
> index f657d49..273b7e0 100755
> --- a/scripts/autobuild-run
> +++ b/scripts/autobuild-run
> @@ -699,6 +699,28 @@ class Builder:
>          with open(os.path.join(self.resultdir, "submitter"), "w+") as submitterf:
>              submitterf.write(self.submitter)
>  
> +        def get_host_distro_info():
> +            """Get the host os distribution info.
> +
> +            Try to get the host os release description from '/etc/os-release'.
> +            """
> +            try:
> +                with open("/etc/os-release") as releasef:
> +                    regexp = re.compile(r'PRETTY_NAME="(.*)"')

You should probably anchor PRETTY_NAME at the beginning of the line, 

Regards,
Yann E. MORIN.

> +                    for line in releasef.readlines():
> +                        m = regexp.search(line)
> +                        if m:
> +                            return m.group(1)
> +            except IOError:
> +                pass
> +
> +            return "unknown"
> +
> +        host_distro_info = get_host_distro_info()
> +
> +        with open(os.path.join(self.resultdir, "host-distro"), "w+") as distrof:
> +            distrof.write(host_distro_info)
> +
>          # Yes, shutil.make_archive() would be nice, but it doesn't exist
>          # in Python 2.6.
>          ret = subprocess.call(["tar", "cjf", "results.tar.bz2", "results"],
> -- 
> 2.20.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
