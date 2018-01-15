From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 14 Jan 2018 22:46:02 -0200
Subject: [Buildroot] support/scripts/xorg-release: what to do?
Message-ID: <5a5bf9ca2534a_4d3ab785e0163c3@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This script is currently broken. Here are some possible actions:

(1) move it to utils/, see http://patchwork.ozlabs.org/patch/783008/
(2) fix code style warnings from flake8
(3) make it callable again. Not that much effort, see this hackish patch
    (notice I limited the size of the lines to make it more email-friendly)
    +++ support/scripts/xorg-release
    @@ -36,3 +36,3 @@ XORG_EXCEPTIONS = [
     def get_xorg_release_pkgs():
    -    u = urllib.URLopener().open("http://www.x.org/releases/%s/src/every...
    +    u = urllib.URLopener().open("https://www.x.org/releases/%s/src/ever...
         b = BeautifulSoup.BeautifulSoup()
    @@ -67,2 +67,6 @@ BUILDROOT_EXCEPTIONS = [
         "xdriver_xf86-input-tslib", # From Pengutronix, not part of X.org r...
    +    "xdriver_xf86-video-imx-viv",
    +    "xdriver_xf86-video-intel",
    +    "xdriver_xf86-video-voodoo",
    +    "xserver_xorg-server",
     ]
(4) support xserver_xorg-server with multiple versions. I am not sure it makes
    sense to add such support, maybe it must be added to list of exceptions too
    because all versions would always be reported as newer.
(5) update BUILDROOT_EXCEPTIONS to ignore all results that must be ignored.
    I guess every package using
    http://xorg.freedesktop.org/releases/individual/app
    will always have newer version and then need to be ignored.
(6) remove the script
(7) do nothing
(8) add a magic comment to the script to make flake8 do skip checking it

I am willing to do either (1=resend)+(2)+(3), only (2) or only (8) myself as
part of the series fixing flake8 warning in the tree.

But someone with more knowledge about the xorg packages (who will actually
*use* the script) should do (4)+(5) IMO.

I don't like (7) because the series will contain a job for gitlab that runs
flake8 and would fail from the beginning.

Thoughts?

Regards,
Ricardo
