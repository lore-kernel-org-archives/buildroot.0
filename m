From: =?UTF-8?B?QW5kcsOpIEVyZG1hbm4=?= <dywi@mailerd.de>
Date: Sun, 01 Mar 2015 01:09:17 +0100
Subject: [Buildroot] [PATCH 00/13] autobuild-run: python3 compat and
	misc improvements
In-Reply-To: <EEF2BEA7-3CA2-4250-8E78-E2585246EE66@gmail.com>
References: <1424899050-24932-1-git-send-email-dywi@mailerd.de>
 <20150226110858.183d31f3@free-electrons.com>
 <EEF2BEA7-3CA2-4250-8E78-E2585246EE66@gmail.com>
Message-ID: <54F258AD.5040301@mailerd.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2015/2/28 Thomas De Schampheleire <patrickdepinguin@gmail.com>:
> On February 26, 2015 11:08:58 AM CET, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
>> Dear Andr? Erdmann,
>>
>> On Wed, 25 Feb 2015 22:17:17 +0100, Andr? Erdmann wrote:
>>> Patches 1-4 make autobuild-run compatible with both python >=2.6 and
>> 3.
>>>
>>> Patches 5-9 are minor enhancements (mostly cleanup).
>>>
>>> Patches 10- are more invasive:
>>> * move the check_requirements() logic to the SystemInfo class
>>> * control environment(->locale), std{in,out,err} of all called
>> commands
>>
>> Thanks a lot all those patches. Overall they look very useful!
>>
>> I really need to spend some time to merge the patches proposed by
>> Thomas DS, and then your patches. I would still like to give the
>> priority to Thomas DS patches, since they have been in the queue for a
>> very long time.
>>
> 
> Andr?,
> 
> Could you give your personal feedback on the usage of docopt in my patches? Do
>  you think it is an improvement or rather an unnecessary dependency?
> 
> ThomasP has a different opinion than me, and there haven't been many other
>  opinions so far. Your input is this most definitely welcome, no matter which side
>  you choose.
> 


The advantage of docopt is that it's really simple and you always have the
usage message in the script, but I'd prefer argparse primarily because it's a built-in
module (in py >= 2.7). It also features arg validation (via type=<function|type>).
There's much more like subparsers, call a <function> each time an <arg> is encountered
and whatnot, but that's not of interest here.

The major improvement of the docopt approach is reading the config (argv/file)
into a few dicts that can be easily merged rather than doing a 3-way merge manually
(defaults as locals X ini file parser X argparser namedtuple-like object). That's a
good idea. It's doable with argparse as well, "vars(parser.parse_args())" returns
the parsed args as dict.

So, the ((untested)) prototype of a "dict-improved" config_get() argparse variant would be:


def config_get():
   def nonempty(val):
      if val:
         return val
      raise argparse.ArgumentTypeError("must be a non-empty value.")
   # --- end of nonempty (...) ---

   def positive_int(val):
      ival = int(val)
      if ival > 0:
         return ival
      raise argparse.ArgumentTypeError("must be > 0 : %s" % val)
   # --- end of positive_int (...) ---

   ## this is the dict that config_get() will return later on
   config = {
      "ninstances": 1, "njobs": 1, "http_login": None, "http_password": None, submitter: "N/A"
   } 

   ## build up the arg parser
   parser = argparse.ArgumentParser(...)

   ## note the use of SUPPRESS:
   ##  the option won't make it into the (namespace object =>) dict if it is not specified on the cmdline
   parser.add_argument("--ninstances", "-n", default=argparse.SUPPRESS, type=positive_int, help=...)
   ...more args...
   parser.add_argument("--submitter", "-s", default=argparse.SUPPRESS, type=nonempty, ...)
   parser.add_argument("--config", "-c", default=None, ...)

   ## parse args, store key/values in a dict
   argv_config = vars(parser.parse_args())

   ## load config file, if any
   if argv_config.get("config"):
      ## load_ini_config() must return a "usable" dict
      ##  (e.g. convert "a-b" keys to "a_b", drop empty values, use parser.getint() where appropriate)
      config_from_file = load_ini_config(argv_config["config"])
 
      ## transfer config from file to the result dict
      ##  (overrides default entries)
      config.update(config_from_file)
   # -- end if

   ## drop the "config" key from argv config, no longer needed
   argv_config.pop("config",None)

   ## transfer argv config to the result dict
   ##  (overrides entries from defaults, config_from_file)
   config.update(argv_config)

   return config
# --- end of config_get (...) ---


config_get() would then return a dict that can be passed around
(multiprocessing.Process(target=run_instance, args=(i, config, sysinfo)),
do_build(instance, log, config), send_results(instance, log, result, config) a.s.o.)

-- 
Andr?


 
