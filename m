From: Carlos Santos <unixmania@gmail.com>
Date: Sat, 28 Mar 2020 18:30:32 -0300
Subject: [Buildroot] [[PATCH RFC] 1/6] package/kmod: add modules-load
 init script
In-Reply-To: <20200321210324.GK4290@scaer>
References: <20200320233547.28586-1-unixmania@gmail.com>
 <20200320233547.28586-2-unixmania@gmail.com>
 <20200321210324.GK4290@scaer>
Message-ID: <CAJ4jsaf8PP=6QJYBOAH-pzrdqAgxbH5MjA6Rz73fQypRt+h6fA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Mar 21, 2020 at 6:03 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Carlos, All,
>
> On 2020-03-20 20:35 -0300, unixmania at gmail.com spake thusly:
> > From: Carlos Santos <unixmania@gmail.com>
> > Use some scripting to mimic the systemd "modules-load" and the OpenRC
> > "modules" services (load kernel modules based on static configuration).
>
> So, the goal is laudable, but the implementation is overly complicated
> and, imho, flawed.

I agree that it is complicated but it's definitely not flawed. It was
thoroughly tested and matches the construction already used in
S02sysctl (check commits 7ab7c6c6b2 and 398c1af1d5).

> > The configuration files should simply contain a list of kernel module
> > names to load, separated by newlines. Empty lines and lines whose first
> > non-whitespace character is # or ; are ignored.
>
> This is avery simple format to parse:
>
>     for d in ${MODULES_DIRS_LIST}; do
>         for f in "${d}"/*; do
>             # Skip empty or missing directories, and dangling symlinks
>             [ -e "${f}" ] || continue

test -e does not fail on empty files or directories:

$ : > /tmp/empty-file
$ ls -l /tmp/empty-file
-rw-rw-r--. 1 casantos casantos 0 Mar 28 18:09 /tmp/empty-file
$ test -e /tmp/empty-file && echo ok
ok
$ mkdir /tmp/empty-dir
$ test -e /tmp/empty-dir && echo ok
ok

>             for m in $(sed -r -e 's/#.+//' "${f}"); do

This goes against good shell scripting practices, as pointed by
shellcheck: "SC2013: To read lines rather than words, pipe/redirect to
a 'while read' loop."

>                 printf 'Loading module %s: ' "${m}"
>                 mpdorobe -s "${m}" && printf 'OK\n' || printf 'FAIL\n'
>             done
>         done
>     done
>
> No need for anything more complex than that.

We need something more complex than that if we care about the script robustness.

> Also, logger is from busybox, and a system may entirely lack busybox.
> Remeber that sysvinit scripts are also used when the init system is,
> well, initsysv instead of busybox.

That's unfortunate. Not being able to send the errors to syslog is
terrible on embedded systems, since usually nobody watches the console
(if any) at boot time.

S02sysctl already assumes that logger is available, so I suppose that
will need to fix it too.

> I've marked the entire series (except patch 3 that I already appiled) as
> changes requested.
>
> Also, you made that S02. But I believe this should come after S10mdev or
> S10udev, which both are going to trigger cold-plug events that may in
> turn trigger module loading.

Good catch. Thanks.

-- 
Carlos Santos <unixmania@gmail.com>
