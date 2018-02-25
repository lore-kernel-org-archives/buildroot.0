From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 25 Feb 2018 17:54:56 +0100
Subject: [Buildroot] [PATH for-next] package/htop: remove 0xe2 from
 MetersPanel.c
In-Reply-To: <20180220222025.3202-1-romain.naour@gmail.com>
References: <20180220222025.3202-1-romain.naour@gmail.com>
Message-ID: <9da09787-d0ae-f573-e226-12bee40b0c37@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20-02-18 23:20, Romain Naour wrote:
> This non ascii character trigger an issue with MakeHeader.py.
> 
> ./scripts/MakeHeader.py MetersPanel.c
> Traceback (most recent call last):
>   File "./scripts/MakeHeader.py", line 32, in <module>
>     for line in file.readlines():
>   File "[...]/output/host/lib/python3.6/encodings/ascii.py", line 26, in decode
>     return codecs.ascii_decode(input, self.errors)[0]
> UnicodeDecodeError: 'ascii' codec can't decode byte 0xe2 in position 956: ordinal not in range(128)

 It would be better to patch MakeHeader.py to avoid this error entirely, which
could also be upstreamed. I *think* it is sufficient to do:

file = open(sys.argv[1], 'rb')

and later

for line in file.readlines():
   line = line[:-1]
   line = line.decode('utf-8')

That should work both in Python 2 and 3.

 Regards,
 Arnout

> 
> Fixes:
> http://autobuild.buildroot.net/results/8ed/8edb78b054a265447fd0e83f67cba5f978be4ed6
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
> Matt, can you test on "U16.04 Bacon" autobuilder ? I can't reproduce here.
> 
> I just looked what changed recently in htop and this commit looks
> suspicious:
> https://github.com/hishamhm/htop/commit/0108117d0b4f1e822f434db173e976aac20b26b5
> 
> Thanks !
> 
> Romain
> ---
>  ...etersPanel-remove-0xe2-from-MetersPanel.c.patch | 52 ++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 package/htop/0001-MetersPanel-remove-0xe2-from-MetersPanel.c.patch
> 
> diff --git a/package/htop/0001-MetersPanel-remove-0xe2-from-MetersPanel.c.patch b/package/htop/0001-MetersPanel-remove-0xe2-from-MetersPanel.c.patch
> new file mode 100644
> index 0000000000..81f9d1bd97
> --- /dev/null
> +++ b/package/htop/0001-MetersPanel-remove-0xe2-from-MetersPanel.c.patch
> @@ -0,0 +1,52 @@
> +From ae32d292ca641c08b6db8d2f7cfcce2a54d00835 Mon Sep 17 00:00:00 2001
> +From: Romain Naour <romain.naour@gmail.com>
> +Date: Tue, 20 Feb 2018 23:09:24 +0100
> +Subject: [PATCH] MetersPanel: remove 0xe2 from MetersPanel.c
> +
> +This non ascii character trigger an issue with MakeHeader.py.
> +
> +./scripts/MakeHeader.py MetersPanel.c
> +Traceback (most recent call last):
> +  File "./scripts/MakeHeader.py", line 32, in <module>
> +    for line in file.readlines():
> +  File "[...]/output/host/lib/python3.6/encodings/ascii.py", line 26, in decode
> +    return codecs.ascii_decode(input, self.errors)[0]
> +UnicodeDecodeError: 'ascii' codec can't decode byte 0xe2 in position 956: ordinal not in range(128)
> +
> +http://autobuild.buildroot.net/results/8ed/8edb78b054a265447fd0e83f67cba5f978be4ed6/build-end.log
> +
> +Signed-off-by: Romain Naour <romain.naour@gmail.com>
> +---
> + MetersPanel.c | 2 +-
> + MetersPanel.h | 2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/MetersPanel.c b/MetersPanel.c
> +index 3cf3e07..47296a4 100644
> +--- a/MetersPanel.c
> ++++ b/MetersPanel.c
> +@@ -37,7 +37,7 @@ static const char* const MetersFunctions[] = {"Style ", "Move  ", "
> + static const char* const MetersKeys[] = {"Space", "Enter", "  ", "Del", "F10"};
> + static int MetersEvents[] = {' ', 13, ERR, KEY_DC, KEY_F(10)};
> + 
> +-// We avoid UTF-8 arrows ? ? here as they might display full-width on Chinese
> ++// We avoid UTF-8 arrows <- -> here as they might display full-width on Chinese
> + // terminals, breaking our aligning.
> + // In <http://unicode.org/reports/tr11/>, arrows (U+2019..U+2199) are
> + // considered "Ambiguous characters".
> +diff --git a/MetersPanel.h b/MetersPanel.h
> +index e00169c..e80754a 100644
> +--- a/MetersPanel.h
> ++++ b/MetersPanel.h
> +@@ -29,7 +29,7 @@ struct MetersPanel_ {
> + 
> + // Note: In code the meters are known to have bar/text/graph "Modes", but in UI
> + // we call them "Styles".
> +-// We avoid UTF-8 arrows ? ? here as they might display full-width on Chinese
> ++// We avoid UTF-8 arrows <- -> here as they might display full-width on Chinese
> + // terminals, breaking our aligning.
> + // In <http://unicode.org/reports/tr11/>, arrows (U+2019..U+2199) are
> + // considered "Ambiguous characters".
> +-- 
> +2.14.3
> +
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
