From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 12 Nov 2018 22:47:55 +0100
Subject: [Buildroot] [PATCH 4/4] iucode-tool: rewrite init script
In-Reply-To: <20181104210241.20237-5-casantos@datacom.com.br> (Carlos Santos's
 message of "Sun, 4 Nov 2018 19:02:41 -0200")
References: <20181104210241.20237-1-casantos@datacom.com.br>
 <20181104210241.20237-5-casantos@datacom.com.br>
Message-ID: <87a7me55o4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Carlos" == Carlos Santos <casantos@datacom.com.br> writes:

 > - Indent with tabs.
 > - Use a function for start.
 > - Use a dummy function that reports OK for stop, restart and reload.
 > - Pass "-q" to iucode_tool to inhipt usual output taht would otherwise

s/inhipt/inhibit/
s/taht/that/

>   interfere with the operation status report.

 > Signed-off-by: Carlos Santos <casantos@datacom.com.br>
 > ---
 >  package/iucode-tool/S00iucode-tool | 37 +++++++++++++++++++-----------
 >  1 file changed, 23 insertions(+), 14 deletions(-)

 > diff --git a/package/iucode-tool/S00iucode-tool b/package/iucode-tool/S00iucode-tool
 > index a97b33c045..eb9f93ad6e 100644
 > --- a/package/iucode-tool/S00iucode-tool
 > +++ b/package/iucode-tool/S00iucode-tool
 > @@ -5,19 +5,28 @@
 
 >  MICROCODE_DIR="/lib/firmware/intel-ucode"
 
 > +start() {
 > +	printf 'Starting iucode-tool: '
 > +	/usr/sbin/iucode_tool -q -k "$MICROCODE_DIR"
 > +	status="$?"
 > +	if [ "$status" = 0 ]; then
 > +		echo "OK"
 > +	else
 > +		echo "FAIL"
 > +	fi
 > +	return "$status"
 > +}
 > +
 > +dummy() {
 > +	echo "$1" | sed 's/^./\U&\E/;s/p/pp/;s/$/ing iucode-tool: OK/'

This is IMHO not very readable, and busybox sed doesn't like it:

# echo 'stop' | sed 's/^./\U&\E/;s/p/pp/;s/$/ing iucode-tool: OK/'
UsEtopping iucode-tool: OK

So I've dropped this and committed to next, thanks.

> +}
 > +
 >  case "$1" in
 > -  start)
 > -	echo "Starting iucode-tool:"
 > -	/usr/sbin/iucode_tool -k "$MICROCODE_DIR"
 > -	echo "done"
 > -	;;
 > -  stop)
 > -	;;
 > -  restart|reload)
 > -	;;
 > -  *)
 > -	echo "Usage: $0 {start|stop|restart}"
 > -	exit 1
 > +	start)
 > +		start;;
 > +	stop|restart|reload)
 > +		dummy "$1";;
 > +	*)
 > +		echo "Usage: $0 {start|stop|restart}"

You forgot to document "reload".

-- 
Bye, Peter Korsgaard
