From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 23 Mar 2018 22:23:52 +0100
Subject: [Buildroot] Unicode problem with check-uniq-files
In-Reply-To: <20180322204145.GB4580@scaer>
References: <3a25e768-759e-e377-fcae-48c8e3e36ddd@jcz.nl>
 <20180319213240.GA340@scaer> <86fb507f-1fa7-8355-6ec6-7b346e6945e7@jcz.nl>
 <20180321214436.GA2085@scaer> <5ffd29df-7b21-122a-2d50-03fc86f29224@jcz.nl>
 <f965a6fb-db48-b39c-6f49-46a025fc63ad@jcz.nl> <20180322204145.GB4580@scaer>
Message-ID: <4c35ffb4-3962-b3e8-5b6e-82103d6a50fa@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 22-03-18 21:41, Yann E. MORIN wrote:
> Jaap, All,
> 
> Please, keep the list in Cc next time...
> 
> On 2018-03-22 11:56 +0100, Jaap Crezee spake thusly:
>> On 03/22/18 11:43, Jaap Crezee wrote:
>>> ./support/scripts/check-uniq-files -t target /data/work/jcz/git/jidiot/clients/innr/buildroot_development/output/build/packages-file-list.txt
>>> Traceback (most recent call last):
>>>   File "./support/scripts/check-uniq-files", line 42, in <module>
>>>     sys.exit(main())
>>>   File "./support/scripts/check-uniq-files", line 31, in main
>>>     for row in r:
>>>   File "/usr/lib/python3.6/encodings/ascii.py", line 26, in decode
>>>     return codecs.ascii_decode(input, self.errors)[0]
>>> UnicodeDecodeError: 'ascii' codec can't decode byte
>>
>> Attached patch is working for me. If you agree with it, you can apply it.
>> If you like I can ack. If you do not agree with this patch, what do you suggest?
> 
>> diff --git a/support/scripts/check-uniq-files b/support/scripts/check-uniq-files
>> index be808cce03..82b0af24ba 100755
>> --- a/support/scripts/check-uniq-files
>> +++ b/support/scripts/check-uniq-files
>> @@ -26,7 +26,7 @@ def main():
>>          return False
>>  
>>      file_to_pkg = defaultdict(list)
>> -    with open(args.packages_file_list[0], 'r') as pkg_file_list:
>> +    with open(args.packages_file_list[0], 'r', encoding="utf-8") as pkg_file_list:
>>          r = csv.reader(pkg_file_list, delimiter=',')
>>          for row in r:
>>              pkg = row[0]
> 
> I'll be testing that, but it has to work in quite a few situations:
> 
>   - python 2.6, python 2.7, python 3.x
> 
>   - current locale is UTF-8 (is it LANG, or any of the other LC_* ones?)
>     or it is not an UTF-8 locale.
> 
> However, we already discussed this with Thomas on IRC the other day, and
> nothing guarantees that filenames are stored as UTF-8 streams on disk.
> 
> Since packages-file-list.txt only contains whatever 'find' will put in
> there, and that 'find' will only put whatever it sees on-disk, its
> encoding is definitely unpredictable, probably depending on the user's
> configuration.
> 
> So, even if UTF-8 is the prevalent encoding, nothing guarantees that it
> is the only one we'd ever see, AFAIU...

 Good point. Although in practice, if a package ever does this, the autobuilders
will detect it.


> Which means that your solution is probably just only a workaround that
> happens to work for you and a lot of other situations, but is not the
> correct solution.
> 
> I've been hacking that check-uniq-file script for two evenings now, and
> I still don't see a good solution that makes it work in both python2 and
> python3, with an UTF-8 locale or not...

 How about reading in 'rb' mode? Then we can't use csv anymore, but who cares
anyway, we just need to split one comma. Or alternatively, we can do (untested):

    with open(args.packages_file_list[0], 'rb') as pkg_file_list:
        pkg_file_string = pkg_file_list.read().decode('ascii', 'replace')
        r = csv.reader(pkg_file_string, delimiter=',')


 Regards,
 Arnout

> 
> I was thinking that maybe we could make it a python2 (not python)
> script, but then some distros are switching to a python3-only setup
> now, so that would break on those distros... Do you use such a distro,
> by chance? Which one?
> 
> Anyway, more testing to be done here, thanks for the suggestion. I'll
> report back later...
> 
> Regards,
> Yann E. MORIN.
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
