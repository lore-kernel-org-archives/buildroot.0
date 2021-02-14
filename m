From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Feb 2021 10:14:05 +0100
Subject: [Buildroot] [PATCH] support/scripts/cpedb.py: drop CPE XML
 database caching
In-Reply-To: <20210213221948.25889-1-thomas.petazzoni@bootlin.com>
References: <20210213221948.25889-1-thomas.petazzoni@bootlin.com>
Message-ID: <20210214091405.GD2740149@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2021-02-13 23:19 +0100, Thomas Petazzoni spake thusly:
> Currently, the CPE XML database is parsed into a Python dict, which is
> then pickled into a local file, to speed up the processing of further
> invocations.
> 
> However, it turns out that since the initial implementation, we have
> switched the XML parsing from the out of tree xmltodict module to the
> standard ElementTree one, which has made the parsing much faster. The
> pickle caching only saves 6 seconds, on something that takes more than
> 13 minutes total.
> 
> In addition, this pickle caching consumes a significant amount of RAM,
> causing the Python process to be OOM-killed on a server with 4 GB of
> RAM.
> 
> So let's just drop this caching entirely.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
> This should be applied to master and next. Indeed, the pkg-stats
> results used for autobuild.buildroot.org/stats/ are currently done on
> next, but we also probably want people to have this change in master
> for the 2021.02 release.

Applied to master and next, thanks.

Note a comment below...

> ---
>  support/scripts/cpedb.py | 40 ++++++----------------------------------
>  1 file changed, 6 insertions(+), 34 deletions(-)
> 
> diff --git a/support/scripts/cpedb.py b/support/scripts/cpedb.py
> index 825ed6cb1e..b1e7e7012c 100644
> --- a/support/scripts/cpedb.py
> +++ b/support/scripts/cpedb.py
[--SNIP--]
> @@ -121,24 +105,12 @@ class CPEDB:
>              cpe_dict = requests.get(CPEDB_URL)
>              open(cpe_dict_local, "wb").write(cpe_dict.content)
>  
> -        cache_all_cpes = os.path.join(self.nvd_path, "cpe", "all_cpes.pkl")
> -        cache_all_cpes_no_version = os.path.join(self.nvd_path, "cpe", "all_cpes_no_version.pkl")
> -
> -        if not os.path.exists(cache_all_cpes) or \
> -           not os.path.exists(cache_all_cpes_no_version) or \
> -           os.stat(cache_all_cpes).st_mtime < os.stat(cpe_dict_local).st_mtime or \
> -           os.stat(cache_all_cpes_no_version).st_mtime < os.stat(cpe_dict_local).st_mtime:
> -            self.gen_cached_cpedb(cpe_dict_local,
> -                                  cache_all_cpes,
> -                                  cache_all_cpes_no_version)
> -
> -        print("CPE: Loading CACHED dictionary")
> -        cpe_file = open(cache_all_cpes, 'rb')
> -        self.all_cpes = pickle.load(cpe_file)
> -        cpe_file.close()
> -        cpe_file = open(cache_all_cpes_no_version, 'rb')
> -        self.all_cpes_no_version = pickle.load(cpe_file)
> -        cpe_file.close()
> +        print("CPE: Unzipping xml manifest...")
> +        nist_cpe_file = gzip.GzipFile(fileobj=open(cpe_dict_local, 'rb'))
> +        print("CPE: Converting xml manifest to dict...")
> +        tree = ET.parse(nist_cpe_file)

Once your nist_cpe_file has been parsed, you could delete it to reclaim
some memory:

    del nist_cpe_file

And maybe do so for a few other intemediate blobs that are really big...

Regards,
Yann E. MORIN.

> +        all_cpedb = tree.getroot()
> +        self.parse_dict(all_cpedb)
>  
>      def parse_dict(self, all_cpedb):
>          # Cycle through the dict and build two dict to be used for custom
> -- 
> 2.29.2
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
