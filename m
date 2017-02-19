From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 19 Feb 2017 20:13:05 -0300
Subject: [Buildroot] [PATCH 2/9] support/scripts/check-package: new
	script
References: <CAAXf6LX2Od0aXd8s65PQkV5omNJiwgvB+dpFt6LC7bCX_6FhNQ@mail.gmail.com>
Message-ID: <58aa268159714_37663ff65a97ad204148b@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Tue, Jan 24, 2017 at 07:14 PM, Thomas De Schampheleire wrote:

[snip]
>> +CONFIG_IN_FILENAME = re.compile("/Config\.in(\.host)?$")
> 
> Beware, there are packages with different config filenames:
> 
> linux/Config.ext.in
> linux/Config.tools.in
> package/php/Config.ext
> package/qt/Config.gfx.in
> package/qt/Config.keyboard.in
> package/qt/Config.mouse.in
> package/qt/Config.sql.in

Thanks for pointing that out. I missed that.
Fixed in v2.

[snip]
>> +def call_check_function(function, fname, args, **kwargs):
> 
> What are these 'args' ? Shouldn't it be '*args' with asterisk?
> https://pythontips.com/2013/08/04/args-and-kwargs-in-python-explained/
> Same in other functions.

No, this parameter holds the command line options after processed by argparse.
In v2 I renamed it to flags and it is not used as parameters to functions.

[snip]
>> +        if args.verbose >= 3:
> 
> perhaps define named constants instead of magic '3' ?

Done in v2.

[snip]
>> +    callbacks = inspect.getmembers(lib, inspect.isfunction)
>> +
>> +    # Do not call helper functions.
>> +    callbacks = [cb for cb in callbacks if not cb[0].startswith("_")]
>> +
>> +    if args.include_list:
>> +        callbacks = [cb for cb in callbacks if cb[0] in args.include_list]
>> +    if args.exclude_list:
>> +        callbacks = [cb for cb in callbacks if cb[0] not in args.exclude_list]
> 
> It looks cleaner to me to create a custom function with all the checks
> (no helper functions, include list, exclude list) and pass that to
> inspect.getmembers, rather than doing it in four steps. The custom
> function should then return True only if the function should be kept,
> and False otherwise. See
> https://docs.python.org/2/library/inspect.html#inspect.getmembers

Fixed in v2.

Please notice I used a bit of hack to make this happen: flags, previously called
args, is now a global variable. I am still unsure if it should be _flags.
Another way to accomplish the same would be dynamically define the custom
predicate function in the main function and pass it as parameter. I think it
would be hard to understand.
If you or somebody else knows a better way, please let me know and I can respin
the series or send a followup patch.

[snip]
> 
> I find the concept with start and end parameter odd and unpythonic.
> Why do you not let each checker be a class, rather than a function?
> Each class can then define a start, check and end method (or other
> names), which you call above.

Thanks. Much better now in v2.
I also:
- rename the methods to before(), check_line() and after();
- create a base class;
- remove the useless "check_" prefix from the names;
- follow CapWords convention since now they are classes;

[snip]
>> +        check_newline_at_eof.lastline = "\n"
> 
> With a class, you could just assign to self here, rather than using
> function statics.

Done.

[snip]

Best regards,
Ricardo
