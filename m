From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sat, 29 Sep 2018 02:40:43 -0300
Subject: [Buildroot] [PATCH v2 1/2] support/scripts/pkg-stats: URL
 checking support
References: <1537544157-2992-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <5baf105b8a4db_62ce3fdd0e07d070321fb@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

In overall looks good. A few issues to fix below.

On Fri, Sep 21, 2018 at 12:35 PM, Matt Weber wrote:

[snip]
>  INFRA_RE = re.compile("\$\(eval \$\(([a-z-]*)-package\)\)")
>  
[snip]
> +    def set_url(self):
> +        """
> +        Fills in the .url field
> +        """
> +        in_help_section = False
> +        self.url_status = "No Config.in"
> +        for filename in os.listdir(os.path.dirname(self.path)):
> +            if fnmatch.fnmatch(filename, 'Config.*'):
> +                fp = open(os.path.join(os.path.dirname(self.path), filename), "r")
> +                for config_line in fp:
> +                    if config_line.strip() == "help":
> +                        in_help_section = True

Please take at look at HelpText @ utils/checkpackagelib/lib_config.py
A Config.in can have many help sections (one per option) so using a single flag
to know if we are at a help section is not enough. When any string from
entries_that_should_not_be_indented appears at the beginning of a line, the help
section is over.
But maybe we don't even need to check this, if the regexp is more strict.

> +                    if in_help_section and re.match("(.*)https?://", config_line):

For package/libcoap/Config.in
the regexp will find 'CoAP, see <http://coap.technology>.'

And for package/lttng-babeltrace/Config.in
'Trace Format (see <http://diamon.org/ctf/>). Babeltrace'

... so a better regexp would be:
re.match("\s*https?://", config_line):

Also it is good practice to compile the regexp just like it is done for
INFRA_RE. Because this script have a small number of regexps and the Python
interpreter do some caching (I don't know the internals of this), probably it
won't make a difference in performance. But this code does potentially 2000+
regexp compile() while only one is needed.

> +                        self.url = ''.join(config_line.split())

join() is not needed. Actually we want to match only 'upstream URLs' that are
always the only text in a line, so an even better regexp would be:

re.match("\s*https?://\S*$", config_line):
or
re.match("\s*https?://\S*\s*$", config_line):
if you want the regexp work even when there are trailing white spaces.

... so no need to join() or split(), just strip().

Notice I didn't tested any code I suggested.

[snip]
> +def check_url_status(pkg):
> +    if pkg.url_status != "Missing" and pkg.url_status != "No Config.in":
> +        try:
> +            url_status_code = requests.head(pkg.url, timeout=5).status_code

This timeout is a bit strict in my opinion, but that is not that important in
this first patch, using serial requests.
It will became important in the next patch, to avoid false timeouts for slow
hosts, or hosts with a high load, or limited internet connection, or slow
servers ... so in the next patch I will suggest to use 30 seconds.
       
> +            if url_status_code >= 400:
> +                pkg.url_status = "Invalid(%s)" % str(url_status_code)
> +        except requests.exceptions.RequestException as e:
> +            return

Please fix the 3 warnings from flake8.


Regards,
Ricardo
